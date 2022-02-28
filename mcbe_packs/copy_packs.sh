#!/bin/bash
cp -rf /mcbe_packs/resource_packs/* /mcbe_server/resource_packs/;
cp -rf /mcbe_packs/behavior_packs/* /mcbe_server/behavior_packs/;

./bedrock_server;