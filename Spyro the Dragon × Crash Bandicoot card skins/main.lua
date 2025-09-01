-- Note for developers --
-- The reason why this code is so heavily commented is because it's supposed to be read by people who want to try making a mod real quick and have zero coding knowledge. The comments are supposed to teach them how each part works, with the best of my knowledge.
-- Check out Rare K's "Balatro Modding 101, How to Install & Make Mods! 2025 Edition!" https://www.youtube.com/watch?v=n5pBgrOFHoA to get some extra help.

-- This will show the mod's icon in the "Mods" menu. The key MUST be "modicon" otherwise the icon won't load
SMODS.Atlas({ key = "modicon", path = "spyrocrash_icon.png", px = 32, py = 32 })

-- This is a thrown together way to localize some text. It's not ideal because the text here is effectively hard-coded and more difficult to localize. I can't help it, sedly, because I don't know how to make a localization file work. I'll be happy to update this code if you explain me how to do that.
-- All the languages are combined in a single string for easier reuse
local lc_txt = { ['en-us'] = "Low Contrast Colors", ['it'] = "Colori a basso contrasto" }
local hcs_txt = { ['en-us'] = "High Contrast Suits", ['it'] = "Semi ad alto contrasto" }
local hc_txt = { ['en-us'] = "High Contrast Colors", ['it'] = "Colori ad alto contrasto" }

-- These three lines will act as a "shortener" whenever these specific strings need to be called, making the code lighter
local franks = {'Jack', 'Queen', 'King'} -- "Face ranks", the face cards only
local eranks = {'Jack', 'Queen', 'King', 'Ace'} -- "Extra ranks", so face cards and the Ace
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'} -- All the ranks

-- The following groups of five strings are used to determine the atlas entries. You can put anything between "local" and "=", as long as you can remember it when you'll need it.
-- Don't worry about this "atlas", by the way, it's managed by Steamodded.
local atlas_h_crash_lc = SMODS.Atlas { key = "crash_h_lc", path = "collab/collab_CB_1.png", px = 71, py = 95 } -- by default, Steamodded checks the "assets/1x" and "assets/2x" in the mod folders. If you put your textures in sub-folders that go deeper than that, it's better to specify them
local atlas_h_crash_hcs = SMODS.Atlas { key = "crash_h_hcs", path = "collab/collab_CB_3.png", px = 71, py = 95 }
local atlas_h_crash_hc = SMODS.Atlas { key = "crash_h_hc", path = "collab/collab_CB_2.png", px = 71, py = 95 }
local atlas_h_crash_cd = SMODS.Atlas { key = "crash_h_cd", path = "hearts_crash.png", px = 71, py = 95 }
local atlas_h_crash_dm = SMODS.Atlas { key = "crash_h_dm", path = "hearts_crash_dm.png", px = 71, py = 95 }

local atlas_c_spyro_lc = SMODS.Atlas { key = "spyro_c_lc", path = "collab/collab_StDv_1.png", px = 71, py = 95 }
local atlas_c_spyro_hcs = SMODS.Atlas { key = "spyro_c_hcc", path = "collab/collab_StDv_3.png", px = 71, py = 95 }
local atlas_c_spyro_hc = SMODS.Atlas { key = "spyro_c_hc", path = "collab/collab_StDv_2.png", px = 71, py = 95 }
local atlas_c_spyro_cd = SMODS.Atlas { key = "spyro_c_cd", path = "clubs_spyro.png", px = 71, py = 95 }
local atlas_c_spyro_dm = SMODS.Atlas { key = "spyro_c_dm", path = "clubs_spyro_dm.png", px = 71, py = 95 }

local atlas_d_spyro_e_lc = SMODS.Atlas { key = "spyro_d_elora_lc", path = "collab/collab_StD_1.png", px = 71, py = 95 }
local atlas_d_spyro_e_hcs = SMODS.Atlas { key = "spyro_d_elora_hcs", path = "collab/collab_StD_3.png", px = 71, py = 95 }
local atlas_d_spyro_e_hc = SMODS.Atlas { key = "spyro_d_elora_hc", path = "collab/collab_StD_2.png", px = 71, py = 95 }
local atlas_d_spyro_e_cd = SMODS.Atlas { key = "spyro_d_elora_cd", path = "diamonds_spyro_elora.png", px = 71, py = 95 }
local atlas_d_spyro_e_dm = SMODS.Atlas { key = "spyro_d_elora_dm", path = "diamonds_spyro_elora_dm.png", px = 71, py = 95 }

local atlas_d_spyro_b_lc = SMODS.Atlas { key = "spyro_d_bianca_lc", path = "collab/collab_StDb_1.png", px = 71, py = 95 }
local atlas_d_spyro_b_hcs = SMODS.Atlas { key = "spyro_d_bianca_hcs", path = "collab/collab_StDb_3.png", px = 71, py = 95 }
local atlas_d_spyro_b_hc = SMODS.Atlas { key = "spyro_d_bianca_hc", path = "collab/collab_StDb_2.png", px = 71, py = 95 }
local atlas_d_spyro_b_cd = SMODS.Atlas { key = "spyro_d_bianca_cd", path = "diamonds_spyro_bianca.png", px = 71, py = 95 }
local atlas_d_spyro_b_dm = SMODS.Atlas { key = "spyro_d_bianca_dm", path = "diamonds_spyro_bianca_dm.png", px = 71, py = 95 }

local atlas_s_crash_lc = SMODS.Atlas { key = "crash_s_lc", path = "collab/collab_CBv_1.png", px = 71, py = 95 }
local atlas_s_crash_hcs = SMODS.Atlas { key = "crash_s_hcs", path = "collab/collab_CBv_3.png", px = 71, py= 95 }
local atlas_s_crash_hc = SMODS.Atlas { key = "crash_s_hc", path = "collab/collab_CBv_2.png", px = 71, py = 95 }
local atlas_s_crash_cd = SMODS.Atlas { key = "crash_s_cd", path = "spades_crash.png", px = 71, py = 95 }
local atlas_s_crash_dm = SMODS.Atlas { key = "crash_s_dm", path = "spades_crash_dm.png", px = 71, py = 95 }

--- These will list and render the different palettes, which will come in handy for cross-modding
local palette_hearts = { -- Anything you add here will go in the sub-menu for the color palette
 { -- This starts defining the first palette
  hc_default = false, -- Determines which skin will be used as default high contrast ones. In Lua, boolean operators "nil" or "0" can be used as well to get the same result
  loc_txt = lc_txt, -- Since all language strings have been pre-made at the start of the file, this will parse the one we need. In this case, the text for low contrast colors (lc_txt)
  key = "hearts_lc",
  atlas = atlas_h_crash_lc.key, -- Here's the atlas entry made before (WARNING: usually adding ".key" is optional, but sometimes the mod can cause the game to crash if it's not present. Experiment and see if it works)
  ranks = franks, -- Remember the "franks" string? It's being called here to determine what it's supposed to look for (face cards, in this case)
  display_ranks = franks, -- This, instead, will opt to display the face cards
  pos_style = 'collab' -- This option makes the game check for the face cards only
 }, -- This closes the defined palette
 {
  loc_txt = hcs_txt,
  hc_default = false,
  key = "hearts_hcs",
  atlas = atlas_h_crash_hcs.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hc_txt,
  hc_default = true,
  key = "hearts_hc",
  atlas = atlas_h_crash_hc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = "N. Sane", -- Because this term is going to be used in all languages and only appears twice, placing it inside a local string would've been an overkill
  hc_default = false,
  key = "hearts_cd",
  atlas = atlas_h_crash_cd.key,
  ranks = ranks, -- We're now calling the string to check the whole rank
  display_ranks = eranks, -- This string we did earlier will only display face cards and the Aces
  pos_style = 'ranks' -- This will make the game check for a full rank of cards
 },
} -- This closes "palette_hearts"

local palette_clubs = {
 {
  loc_txt = lc_txt,
  hc_default = false,
  key = "clubs_lc",
  atlas = atlas_c_spyro_lc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hcs_txt,
  hc_default = false,
  key = "clubs_hcs",
  atlas = atlas_c_spyro_hcs.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt =  hc_txt,
  hc_default = true,
  key = "clubs_hc",
  atlas = atlas_c_spyro_hc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = "Reignited",
  hc_default = false,
  key = "clubs_cd",
  atlas = atlas_c_spyro_cd.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 },
}

local palette_diamonds_e = {
 {
  loc_txt = lc_txt,
  hc_default = false,
  key = "diamonds_e_lc",
  atlas = atlas_d_spyro_e_lc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hcs_txt,
  hc_default = false,
  key = "diamonds_e_hcs",
  atlas = atlas_d_spyro_e_hcs.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hc_txt,
  hc_default = true,
  key = "diamonds_e_hc",
  atlas = atlas_d_spyro_e_hc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = "Reignited",
  hc_default = false,
  key = "diamonds_e_cd",
  atlas = atlas_d_spyro_e_cd.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 },
}

local palette_diamonds_b = {
 {
  loc_txt = lc_txt,
  hc_default = false,
  key = "diamonds_b_lc",
  atlas = atlas_d_spyro_b_lc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hcs_txt,
  hc_default = false,
  key = "diamonds_b_hcs",
  atlas = atlas_d_spyro_b_hcs.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hc_txt,
  hc_default = true,
  key = "diamonds_b_hc",
  atlas = atlas_d_spyro_b_hc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = "Reignited",
  hc_default = false,
  key = "diamonds_b_cd",
  atlas = atlas_d_spyro_b_cd.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 },
}

local palette_spades = {
 {
  loc_txt = lc_txt,
  hc_default = false,
  key = "spades_lc",
  atlas = atlas_s_crash_lc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hcs_txt,
  hc_default = false,
  key = "spades_hcs",
  atlas = atlas_s_crash_hcs.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = hc_txt,
  hc_default = true,
  key = "spades_hc",
  atlas = atlas_s_crash_hc.key,
  ranks = franks,
  display_ranks = franks,
  pos_style = 'collab'
 },
 {
  loc_txt = "N. Sane",
  hc_default = false,
  key = "spades_cd",
  atlas = atlas_s_crash_cd.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 },
}

if next(SMODS.find_mod('darktextures')) then -- A Steamodded utility function allows to determine if a mod is present or not. This line, paraphrased, means "check if 'darktextures' (which the Balatro Dark Mode mod) is currently in the list of mods Steamodded has registered upon Balatro startup. If it does, do the following"
 print("Dark Mode detected! Dark Mode palette available!") -- print shows a message in the terminal. In this case, it's to warn the user that the mod is installed and extra palettes are now available
 table.insert(palette_hearts, { --table.insert is a Lua function that allows to add extra entries in an already existing table ("palette_hearts", in this case), usually at the very last position unless specified with a number
  loc_txt = "Dark Mode",
  hc_default = false,
  key = "hearts_dm",
  atlas = atlas_h_crash_dm.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 })-- The round bracket closes table.insert
  table.insert(palette_clubs, { 
  loc_txt = "Dark Mode",
  hc_default = false,
  key = "clubs_dm",
  atlas = atlas_c_spyro_dm.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 })
 table.insert(palette_diamonds_e, { 
  loc_txt = "Dark Mode",
  hc_default = false,
  key = "diamonds_dm_e",
  atlas = atlas_d_spyro_e_dm.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 })
 table.insert(palette_diamonds_b, { 
  loc_txt = "Dark Mode",
  hc_default = false,
  key = "diamonds_dm_b",
  atlas = atlas_d_spyro_b_dm.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 })
 table.insert(palette_spades, { 
  loc_txt = "Dark Mode",
  hc_default = false,
  key = "spades_dm",
  atlas = atlas_s_crash_dm.key,
  ranks = ranks,
  display_ranks = eranks,
  pos_style = 'ranks'
 })
end -- Declares the end of a function

-- This will render the suits
SMODS.DeckSkin {
 loc_txt = "Crash Bandicoot", -- This is how the name will appear in-game
	key = "cb_hearts", -- You probably saw this a few times. Don't worry, you can put anything here. It's a form of identification for Steamodded
 suit = "Hearts", -- This defines the selected suit
 palettes = palette_hearts
} -- This closes SMODS.DeckSkin

SMODS.DeckSkin {
 loc_txt = "Spyro the Dragon",
	key = "std_clubs",
 suit = "Clubs",
 palettes = palette_clubs
}

SMODS.DeckSkin {
 loc_txt = "Spyro the Dragon (Elora)",
	key = "std_e_diamonds",
 suit = "Diamonds",
 palettes = palette_diamonds_e
}

SMODS.DeckSkin {
 loc_txt = "Spyro the Dragon (Bianca)",
	key = "std_b_diamonds",
 suit = "Diamonds",
 palettes = palette_diamonds_b
}

SMODS.DeckSkin {
 loc_txt = "Crash Bandicoot",
	key = "cb_spades",
 suit = "Spades",
 palettes = palette_spades
}

