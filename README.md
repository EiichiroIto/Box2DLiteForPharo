# Box2DLiteForPharo
[![Build Status](https://travis-ci.com/EiichiroIto/Box2DLiteForPharo.svg?branch=master)](https://travis-ci.com/EiichiroIto/Box2DLiteForPharo)

A port of Box2D Lite to Pharo Smalltalk

![Entire Screen1](https://raw.githubusercontent.com/EiichiroIto/Box2DLiteForPharo/master/images/box2dlite.png)

# How to install
To install this project, run the following script in a Pharo 8.0 image.

```Smalltalk
Metacello new
    baseline: 'Box2DLite';
    repository: 'github://EiichiroIto/Box2DLiteForPharo/src';
    load.
```
# Demo
To try demos, run the following script.

```Smalltalk
B2Demo new open.
```
