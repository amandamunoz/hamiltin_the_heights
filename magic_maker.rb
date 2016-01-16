# require 'rubygems'
# require 'markov_chains'

# text = File.read("both.txt")
# generator = MarkovChains::Generator.new(text, 1)
# puts generator.get_sentences(10)


require 'marky_markov'
markov = MarkyMarkov::TemporaryDictionary.new # Saves/opens dictionary.mmd
markov.parse_file "both.txt"
puts markov.generate_n_words 10
puts markov.generate_n_sentences 10
markov.clear! # Saves the modified dictionary/creates one if it didn't exist.


# Okay, here we go toe to toe? I'm from Queens!
# I’m so sorry to bother you at home in this nation's gone from latent to blatant!
# I had never seen a bastard orphan more in need of a song of sixpence.
