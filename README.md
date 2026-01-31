# Hinglish Flow
Transliterate content written in default Latin alphabets that uses both English and Hindi, into content where Latin script is used for English and Devanagari script is used for Hindi.

## Motivation
I talk more about it [here](https://medium.com/@arpvastava/free-flow-writing-in-hinglish-e7d082ab31a7).

You can also view its short demo over [here](https://www.youtube.com/watch?v=UzKdUg70yoo).

I think for now I will continue using it in its current state. I am fine with it. The UI is not that great, but its fine for me. My main motivation was to have something with simple UX, as I didn't find any other solution on Internet that did what I wanted to do.

## How Transliteration Works?
I'm lazy, that's why I offloaded this whole responsibility to LLMs. Currently, I've added option to use Gemini or ChatGPT for performing the transliteration.

## How To Use
1. Use Godot game engine to open the project.
2. You'd need to have minimum Gemini's or OpenAI's API key.
3. Go to `env/env_example.gd` and follow the instructions given in the script.
4. Apply Gemini/OpenAI's API key to their respective variables in `env.gd` script you'd create.

That's it, all done.

## Why Only Source Code?
This is a side-project I made just for my personal use. But I wanted to share it, but the issue is that I am making use of LLMs through their web APIs. To do this I am storing their API keys locally at the moment. Which ain't good at all for security reason (if I decide to publish it so everyone can use it). That's why I use it locally only, so API keys are only accessible to me.

- To overcome this limitation, I would need another layer of abstraction which hides access to these API keys. Basically, I'll have to deploy a backend where this step of calling LLM's API will take place.
- Or else, I can also make my own rule-based or some ML-based solution that runs locally.

But I'm fine with using it locally in its current state, so I don't feel any need to go with all this hassle. That's why I just shared its source code on GitHub, so everyone can view it, as I really enjoyed this short project.