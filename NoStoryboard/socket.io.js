var doodTemplates = require('./monsters.js')
var clientDoods = {}

function genFreebies(deviceId) {
	var freebies = []
	for (var i = 0; i < 5; i++) {
		doodTemplates[i].theOwner = deviceId
		freebies.push(doodTemplates[i])
	}
	return freebies
}

var theWild = []
var lockMeatGrinder = false
var connectionPool = {}
var server = require('http').createServer();
var io = require('socket.io')(server);

var bob = function meatGrinder() {
    if (lockMeatGrinder) {
        console.log('meatGrinder locked')
        return false
    } else {
        lockMeatGrinder = true
        var now = Date.now()
        console.log('grinding meat')
        theWild.forEach(function(guy, a_index) {
			console.log(now + ':' + guy.missionDuration)
            if (now >= guy.missionDuration) {
                if (guy.status != "dead") {
                    // fight the ai
                    guy.status = "complete"
                    guy.experience = Number(guy.experience) + 100
                    guy.doodid = Number(guy.doodid)
                    guy.rarity = Number(guy.rarity)
                    guy.level = Number(guy.level)
                    guy.currentTick = Number(guy.currentTick)
                    guy.duration = 0
                    clientDoods[guy.theOwner].forEach(function(existingDood, index) {
                        if (guy.doodid == existingDood.doodid) {
                            console.log('we have a match, modify master database')  
                            guy.image = existingDood.image
                            guy.imageURL = existingDood.imageURL
                            clientDoods[guy.theOwner][index] = guy
                        }
                    })
                }
                connectionPool[guy.theOwner].emit("dispatchComplete", JSON.stringify(guy))
				console.log('sending dispatch complete back to client')
                delete(theWild[a_index])
            } else {
                if (guy.type == "fighter" && !(guy.status == "complete" || guy.status == "dead")) {
                    var preyPool = []
                    theWild.forEach(function(prey, b_index) {
                        if ((guy.theOwner != prey.theOwner) && (prey.level <= guy.level) && !(prey.status == "complete" || prey.status == "dead")) {
                            preyPool.push(prey)
                        } 
                    })
                    var target = preyPool[Math.floor(Math.random()*preyPool.length)]
                    if (target) {
                        console.log(guy.name + ' hunted down and is going to fight ' + target.name)
                        guy.status = "complete"
                        target.status = "dead"
                        //delete(theWild[a_index])
                        //theWild.forEach(function(dood, c_index) {
                        //    delete(theWild[c_index])
                        //})
                    } else {
                        console.log(guy.name + ' has nothing to hunt..')
                    }
                }
            }
        })
        lockMeatGrinder = false
    }
}

function tossThisGuyIntoTheWild(data) {
	var guy = JSON.parse(data)

    // all game logic needs to reside within the server so clients remain
    // unaffected by rule changes

    // unix epoch is just so much easier to deal with
    var now = Date.now()

    guy.status = "dispatched"

    // this stays inside the server
    // just hard code this value here for now
    guy.missionStart = now
    guy.missionDuration = now + 60000

    // this goes back to the client
    guy.duration = 60 // hard-coded for now
   
    // notify client how long this dood's mission will take 

    // *sigh*
    guy.experience = Number(guy.experience) + 100
    guy.doodid = Number(guy.doodid)
    guy.rarity = Number(guy.rarity)
    guy.level = Number(guy.level)
    guy.duration = Number(guy.duration)
    guy.currentTick = Number(guy.currentTick)

    connectionPool[guy.theOwner].emit('durationCalculatedForDood', JSON.stringify(guy))

    // throw the dood into the arena
    theWild.push(guy)

    /*
    clientDoods[guy.theOwner].forEach(function(existingDood, index) {
        if (guy.doodid == existingDood.doodid) {
            console.log('we have a match, modify master database')  
            clientDoods[guy.theOwner][index] = guy
        }
    })
    */
}

io.on('connection', function(client){
  console.log('A client connected.')
  console.log(client)

  client.emit('acknowledgeConnection', 'acknowledge')

  client.on('init', function(data){
	console.log('Server received "init" request with "' + data + "'.")
	connectionPool[data] = client
	if (!clientDoods[data]) {
	  console.log('This client has no doods. Make some for them.')
	  clientDoods[data] = genFreebies(data)
	} else {
	  console.log('This client appears to have doods already.')
	}
    console.log('the good:')
    console.log(JSON.stringify(clientDoods[data]))
	client.emit('serverSendsDoodList', JSON.stringify(clientDoods[data]))
  })

  client.on('dispatch', function(data){
	console.log('the server received "dispatch" request with "' + data + "'.")
    tossThisGuyIntoTheWild(data)
  })

  client.on('message', function(data){
	client.emit('fromServer', 'Server got ' + data)
	// console.log(data);
  })

  client.on('disconnect', function(){
	console.log('a client disconnected.');
  });
});

server.listen(9000, function() {  
  console.log('server listening to %j', server.address())
});

setInterval(bob, 1000)
