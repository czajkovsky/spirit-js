<img src="https://raw.githubusercontent.com/czajkovsky/spirit-js/master/readme/logo.png" width="350">

## Acknowledges
This project was implemented for fun using [Phaser.io](http://phaser.io/) and is strongly inspired by great [iOS game](https://itunes.apple.com/us/app/spirit/id354998923?mt=8) by Marco Mazzoli. I used [Box2D plugin](http://phaser.io/shop/plugins/box2d) as 2D physics engine. That means you need to buy licence before running it locally.

## Entities
Image  | Description
--------------| -------------
<img src="https://raw.githubusercontent.com/czajkovsky/spirit-js/master/readme/rocket.png" width="151"> | **Your spaceship** - it follows your mouse/finger. When ship is flashing it's protected form enemies.
<img src="https://raw.githubusercontent.com/czajkovsky/spirit-js/master/readme/cloud.png" width="151"> | **Cloud** - hit it with spaceship to activate cloud. Activated cloud on contact with enemy converts it to coin.
<img src="https://raw.githubusercontent.com/czajkovsky/spirit-js/master/readme/enemy-flying.png" width="151"> | **Flying enemy** - it flies from left edge to right edge of the screen.
<img src="https://raw.githubusercontent.com/czajkovsky/spirit-js/master/readme/enemy-random.png" width="151"> | **Random enemy** - this enemy has constant velocity but direction and angle is random.
<img src="https://raw.githubusercontent.com/czajkovsky/spirit-js/master/readme/enemy-sticky.png" width="151"> | **Sticky enemy** - this enemy follows your position.

## Running locally
Install npm packages:
```
npm install
```
Install bower packages:
```
bower install
```
Build and run server:
```
gulp && gulp serve
```
