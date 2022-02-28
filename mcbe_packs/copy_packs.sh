#!/bin/bash


awk 'BEGIN {cmd="cp -ri /mcbe_packs/resource_packs/* /mcbe_server/resource_packs/"; print "n" | cmd}';
awk 'BEGIN {cmd="cp -ri /mcbe_packs/behavior_packs/* /mcbe_server/behavior_packs/"; print "n" | cmd}';
./bedrock_server;