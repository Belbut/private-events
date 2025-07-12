# README

Project: Private events
You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

This project will require you to model many-to-many relationships and also to be very conscious about your foreign keys and class names (hint: you won’t be able to just rely on Rails’ defaults like you have before).


Data Model-----------------------------------------------


User
-name
has_many: hosted_events class_name: Event foreign_key:host_id

has_many: invited_events through:Invitation source:event
has_many: Invitations foreign_key:attendee_id

Event
-date
-place
*belongs_to: host class_name: User
*has_many: Invitations

Invitation
*belongs_to: event
*belongs_to: attendee class_name: User