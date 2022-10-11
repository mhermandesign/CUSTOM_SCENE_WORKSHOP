#SFX Server

I dislike the idea of having an audio source be a child of a game object. My issue with it is that sound in the real world is a globalized pressure wave, occurring when two objects collide or when something is vibrated quickly enough. Percussion and resonance. When something makes a noise, that noise is propagated throughout the environment, interacting with other things. Especially if it's a percussive noise caused by two colliding bodies.

All that to say I want to spawn percussive noises at collision locations rather than having them be attached as children of the colliding bodies.

Currently, 'sfx_server.gd' is autoloaded as a singleton, and handles requests to spawn sfx via a signal, "spawn_sfx". I don't think this is the right method for this module in the long run, because colliding bodies are still bearing some responsibility for creating sfx. This is problematic because it requires a lot of repeating effort to get each object making the correct noises.

I think I'll attempt to use groups instead of signals, and I'm going to look into the PhysicsServer class. Maybe there will be something I can use to grab collisions between specific node groups.

The groups could be things like "wood", "metal", "stone", "hay", "sand", "grass", whatever. In fact, I could build a surface tagging system that can be accessed to get inputs for all kinds of interesting effects. That will need to be another module.

This comment is way too long. Sorry!
