# Visual Signals 3D

This is a plugin to create visual signals.

* [Introduction](#Introduction)
* [Visual signals](#Visual-signals)
* [Creating visual signals](#Creating-visual-signals)
  * [Creating a signal emitter](#Creating-a-signal-emitter)

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

### Creating a signal emitter

First, let's create a new scene called `Clock`. It has a sprite and a timer. Nothing new for now. 

![Creating emitter 1](/images/CreatingEmitter1.png)

Now, I'm adding a new Signal3DEmitterInt.

![Creating emitter 2](/images/CreatingEmitter2.png)

I'm calling it `OnTick`.

![Creating emitter 3](/images/CreatingEmitter3.png)

Now, we want a script on the root node to manage the timer and, later on, the signal emitter.

![Creating emitter 4](/images/CreatingEmitter4.png)

Let's connect the timer's signal.

![Creating emitter 5](/images/CreatingEmitter5.png)

The method we will implement should call the emitter's `emit` method.

![Creating emitter 6](/images/CreatingEmitter6.png)

Finally we can adjust the position of our emitter.

![Creating emitter 7](/images/CreatingEmitter7.png)

### Creating a signal receiver

The nest step is creating an object with a receiver. Let's create a new scene called `Printer`. It also has a sprite.

![Creating receiver 1](/images/CreatingReceiver1.png)

Add a Signal3DReceiverInt.

![Creating receiver 2](/images/CreatingReceiver2.png)

I'm calling it `Print`.

![Creating receiver 3](/images/CreatingReceiver3.png)

We want a script to handle the receiving of signals.

![Creating receiver 4](/images/CreatingReceiver4.png)

Remember that receivers have a normal signal to let us know when a signal is received. Let's connect it.

![Creating receiver 5](/images/CreatingReceiver5.png)

The method to implement just prints the received integer.

![Creating receiver 6](/images/CreatingReceiver6.png)

Finally, adjust the receiver position.

![Creating receiver 7](/images/CreatingReceiver7.png)

## Connecting the signals

With Visual Signals 3D, the receivers are the nodes that are connected to emitters and not viceversa. To illustrate this, let's create a new scene called `example`. I've added some light and a sky, but feel free to leave it blank.

![Connecting signals 1](/images/ConnectingSignals1.png)

Let's instantiate a `Clock` and a `Printer`. You will notice that a new node called `SignalManager` has been created. This node is necessary to handle the connections between emitters and receivers. Also, it is the responsible to draw that connections.

![Connecting signals 2](/images/ConnectingSignals2.png)

When selecting an object that contains one or more receivers, it will have extra properties at top of the inspector. A new property is created for each receiver the object contains.

![Connecting signals 3](/images/ConnectingSignals3.png)

Clicking on the dropdown will show all the emitters that can be connected to that receiver. Also, a visual line will be drawn to tell us what emitter we are going to connect to.

![Connecting signals 4](/images/ConnectingSignals4.png)

Once you select an emitter the connection will be drawn as a white line.

![Connecting signals 5](/images/ConnectingSignals5.png)

And that's all! We can run the scene and see the `Printer` printing the numbers generated by the `Clock`.

![Connecting signals 6](/images/ConnectingSignals6.png)
