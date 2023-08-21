# Visual Signals 3D

This is a plugin to create visual signals.

![Visual Signals 3D](/images/VisualSignals3D.png)

## Introduction

Godot has signals that implements the very known Observer pattern. A signal can be emitted and the observers can react in consecuence.

This plugin adds an extra layer to visualize these signals. 

Visual Signals 3D follows an ECS approach (Entity Component System). Each visual signal will be a node. This node must be seen as a component of the current scene. Thus, the current scene will be an object containing one or more components. Then, you can connect the different objects placed in a greater scene.

## Visual signals

When talking about signals, there are two sides: The emitter and the receiver. To connect two objects, one object must have an emitter, and the other one a receiver. These emitters and receivers are just nodes. For example, you might have an object with a Signal3DEmitter node, and another with a Signal3DReceiver node. The minimum you must know about these nodes is that emitters have a method named `emit` (same as normal signals), and receivers have a normal signal called `receive_signal`. The object with the emitter can emit a signal whenever it wants just by calling the emitter's method `emit`. On the other side, the object with the receiver can receive that signal just by connecting with the receiver's signal `receive_signal`.

A signal has a signature. It can receiver a specified number of arguments. That's why we can have several types of emitters and receivers. Here are a list with all the signals that come with this plugin:

![Visual Signals 3D nodes](/images/VisualSignal3DNodes.png)

The name of the signal reveals how its signature is. If it has the suffix `<number>Param`, then the signal has the number of params it sais. For example, Signal3DEmitterTwoParam has 2 parameters. These parameters can be of any type. However, we have signals like Signal3DEmitterBool that has only one parameter of type `bool`. 

As you may already thinking, emitters and receivers can only be connected if they are of the same type. For example, Signal3DEmitterFloat only can be connected with Signal3DReceiverFloat.

## Creating visual signals

To show how to create visual signals we are going to follow the next example: We want an object that emits a signal every second with a number increasing at each tick; also, we want an object that will print every number it receives from a signal.

> These objects are in this repository inside the example folder.

First, let's create a new scene called Clock. It has a sprite and a timer. Nothing new for now. 

![Creating emitter 1](/images/CreatingEmitter1.png)

Now, I'm adding a new Signal3DEmitterInt.

![Creating emitter 1](/images/CreatingEmitter2.png)

I'm calling it `OnTick`.

![Creating emitter 1](/images/CreatingEmitter3.png)

Now, we want a script on the root node to manage the timer and, later on, the signal emitter.

![Creating emitter 1](/images/CreatingEmitter4.png)

Let's connect the timer's signal.

![Creating emitter 1](/images/CreatingEmitter5.png)

The method we will implement should call the emitter's `emit` method.

![Creating emitter 1](/images/CreatingEmitter6.png)

Finally we can adjust the position of our emitter.

![Creating emitter 1](/images/CreatingEmitter7.png)
