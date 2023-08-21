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

![Visual Signals 3D nodes](/images/VisualSignals3DNodes.png)
