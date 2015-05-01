class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  $GAME_DROPDOWN = [["League of Legends"], ["Hearthstone: Heroes of Warcraft"], ["Dota 2"],
["Counter-Strike: Global Offensive"], ["Minecraft"], ["Grand Theft Auto V"], ["StarCraft II: Heart of the Swarm"],
["Garry's Mod"], ["Poker"], ["ArmA III"], ["Mortal Kombat X"], ["Diablo III: Reaper of Souls"],
["Call of Duty: Advanced Warfare"], ["World of Warcraft: Warlords of Draenor"], ["FIFA 15"], 
["RuneScape"], ["Destiny"], ["Bloodborne"], ["The Witcher 2: Assassins of Kings"], ["World of Tanks"], 
["Smite"], ["World of Warships"], ["DayZ"], ["Path of Exile"], ["Killing Floor 2"], ["Heroes of the Storm"],
["Pokémon Omega Ruby/Alpha Sapphire"], ["Borderlands: The Pre-Sequel!"], ["H1Z1"], ["Dragon Ball XenoVerse"],
["Rust"], ["Magic: The Gathering"]]

end
