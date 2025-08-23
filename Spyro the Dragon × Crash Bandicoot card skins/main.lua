-- Note for developers --
-- The reason why this code is so heavily commented is because it's supposed to be read by people who want to try making a mod real quick and have zero coding knowledge. The comments are supposed to teach them how each part works, with the best of my knowledge.

-- This will show the mod's icon in the "Mods" menu
SMODS.Atlas{ key = "sc_mod_icon", path = "spyrocrash_icon.png", px = 32, py = 32 }

-- These three lines will act as a "shortener" whenever these specific strings need to be called, making the code lighter
local franks = {'Jack', 'Queen', 'King'} -- "Face ranks", the face cards only
local eranks = {'Jack', 'Queen', 'King', 'Ace'} -- "Extra ranks", so face cards and the Ace
local ranks = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'} -- All the ranks

-- The following groups of four strings are used to determine the atlas entry. You can put anything between "local" and "=", as long as you can remember it when you'll need it.
-- Don't worry about this "atlas", by the way, it's managed by Steamodded.
local atlas_h_crash_lc = SMODS.Atlas { key = "crash_h_lc", path = "collab/collab_CB_1.png", px = 71, py = 95 }
local atlas_h_crash_hcs = SMODS.Atlas { key = "crash_h_hcs", path = "collab/collab_CB_3.png", px = 71, py = 95 }
local atlas_h_crash_hc = SMODS.Atlas { key = "crash_h_hc", path = "collab/collab_CB_2.png", px = 71, py = 95 }
local atlas_h_crash_cd = SMODS.Atlas { key = "crash_h_cd", path = "hearts_crash.png", px = 71, py = 95 }

local atlas_c_spyro_lc = SMODS.Atlas { key = "spyro_c_lc", path = "collab/collab_StDv_1.png", px = 71, py = 95 }
local atlas_c_spyro_hcs = SMODS.Atlas { key = "spyro_c_hcc", path = "collab/collab_StDv_3.png", px = 71, py = 95 }
local atlas_c_spyro_hc = SMODS.Atlas { key = "spyro_c_hc", path = "collab/collab_StDv_2.png", px = 71, py = 95 }
local atlas_c_spyro_cd = SMODS.Atlas { key = "spyro_c_cd", path = "clubs_spyro.png", px = 71, py = 95 }

local atlas_d_spyro_e_lc = SMODS.Atlas { key = "spyro_d_elora_lc", path = "collab/collab_StD_1.png", px = 71, py = 95 }
local atlas_d_spyro_e_hcs = SMODS.Atlas { key = "spyro_d_elora_hcs", path = "collab/collab_StD_3.png", px = 71, py = 95 }
local atlas_d_spyro_e_hc = SMODS.Atlas { key = "spyro_d_elora_hc", path = "collab/collab_StD_2.png", px = 71, py = 95 }
local atlas_d_spyro_e_cd = SMODS.Atlas { key = "spyro_d_elora_cd", path = "diamonds_spyro_elora.png", px = 71, py = 95 }

local atlas_d_spyro_b_lc = SMODS.Atlas { key = "spyro_d_bianca_lc", path = "collab/collab_StDb_1.png", px = 71, py = 95 }
local atlas_d_spyro_b_hcs = SMODS.Atlas { key = "spyro_d_bianca_hcs", path = "collab/collab_StDb_3.png", px = 71, py = 95 }
local atlas_d_spyro_b_hc = SMODS.Atlas { key = "spyro_d_bianca_hc", path = "collab/collab_StDb_2.png", px = 71, py = 95 }
local atlas_d_spyro_b_cd = SMODS.Atlas { key = "spyro_d_bianca_cd", path = "diamonds_spyro_bianca.png", px = 71, py = 95 }

local atlas_s_crash_lc = SMODS.Atlas { key = "crash_s_lc", path = "collab/collab_CBv_1.png", px = 71, py = 95 }
local atlas_s_crash_hcs = SMODS.Atlas { key = "crash_s_hcs", path = "collab/collab_CBv_3.png", px = 71, py= 95 }
local atlas_s_crash_hc = SMODS.Atlas { key = "crash_s_hc", path = "collab/collab_CBv_2.png", px = 71, py = 95 }
local atlas_s_crash_cd = SMODS.Atlas { key = "crash_s_cd", path = "spades_crash.png", px = 71, py = 95 }

-- This will render the suits
SMODS.DeckSkin {
 loc_txt = "Crash Bandicoot", -- This is how the name will appear in-game
	key = "cb_hearts", -- You probably saw this a few times. Don't worry, you can put anything here. It's a form of identification for Steamodded
 suit = "Hearts",
 palettes = { -- Anything you add here will go in the sub-menu for the color palette
  { -- This starts defining the first palette
   loc_txt =  "Low Contrast Colors",
   hc_default = false, -- Determines which skin will be used as default high contrast ones
   key = "hearts_lc",
   atlas = atlas_h_crash_lc.key, -- Here's the atlas entry made before (WARNING: usually, adding ".key" is optional, but sometimes the mod can cause the game to crash if it's not present. Experiment and see if it works)
   ranks = franks, -- Remember the "franks" string? It's being called here to determine what it's supposed to look for (face cards, in this case)
			display_ranks = franks, -- This, instead, will opt to display the face cards
   pos_style = 'collab' -- This option make the game check for the face cards only
  }, -- This closes the defined palette
  {
   loc_txt =  "High Contrast Suits",
   hc_default = false,
   key = "hearts_hcs",
   atlas = atlas_h_crash_hcs.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Colors",
   hc_default = true,
   key = "hearts_hc",
   atlas = atlas_h_crash_hc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "N. Sane",
   hc_default = false,
   key = "hearts_cd",
   atlas = atlas_h_crash_cd.key,
   ranks = ranks, -- We're now calling the string to check the whole rank
			display_ranks = eranks, -- This string we did earlier will only display face cards and the Aces
   pos_style = 'ranks' -- This will make the game check for a full rank of cards
  },
 } -- This closes "palettes"
} -- This closes SMODS.DeckSkin

SMODS.DeckSkin {
 loc_txt = "Spyro the Dragon",
	key = "std_clubs",
 suit = "Clubs",
 palettes = {
  {
   loc_txt =  "Low Contrast Colors",
   hc_default = false,
   key = "clubs_lc",
   atlas = atlas_c_spyro_lc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Suits",
   hc_default = false,
   key = "clubs_hcs",
   atlas = atlas_c_spyro_hcs.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Colors",
   hc_default = true,
   key = "clubs_hc",
   atlas = atlas_c_spyro_hc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "Reignited",
   hc_default = false,
   key = "clubs_cd",
   atlas = atlas_c_spyro_cd.key,
   ranks = ranks,
			display_ranks = eranks,
   pos_style = 'ranks'
  },
 }
}

SMODS.DeckSkin {
 loc_txt = "Spyro the Dragon (Elora)",
	key = "std_e_diamonds",
 suit = "Diamonds",
 palettes = {
  {
   loc_txt =  "Low Contrast Colors",
   hc_default = false,
   key = "diamonds_e_lc",
   atlas = atlas_d_spyro_e_lc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Suits",
   hc_default = false,
   key = "diamonds_e_hcs",
   atlas = atlas_d_spyro_e_hcs.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Colors",
   hc_default = true,
   key = "diamonds_e_hc",
   atlas = atlas_d_spyro_e_hc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "Reignited",
   hc_default = false,
   key = "diamonds_e_cd",
   atlas = atlas_d_spyro_e_cd.key,
   ranks = ranks,
			display_ranks = eranks,
   pos_style = 'ranks'
  },
 }
}

SMODS.DeckSkin {
 loc_txt = "Spyro the Dragon (Bianca)",
	key = "std_b_diamonds",
 suit = "Diamonds",
 palettes = {
  {
   loc_txt =  "Low Contrast Colors",
   hc_default = false,
   key = "diamonds_b_lc",
   atlas = atlas_d_spyro_b_lc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Suits",
   hc_default = false,
   key = "diamonds_b_hcs",
   atlas = atlas_d_spyro_b_hcs.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Colors",
   hc_default = true,
   key = "diamonds_b_hc",
   atlas = atlas_d_spyro_b_hc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "Reignited",
   hc_default = false,
   key = "diamonds_b_cd",
   atlas = atlas_d_spyro_b_cd.key,
   ranks = ranks,
			display_ranks = eranks,
   pos_style = 'ranks'
  },
 }
}

SMODS.DeckSkin {
 loc_txt = "Crash Bandicoot",
	key = "cb_spades",
 suit = "Spades",
 palettes = {
  {
   loc_txt =  "Low Contrast Colors",
   hc_default = false,
   key = "spades_lc",
   atlas = atlas_s_crash_lc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Suits",
   hc_default = false,
   key = "spades_hcs",
   atlas = atlas_s_crash_hcs.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "High Contrast Colors",
   hc_default = true,
   key = "spades_hc",
   atlas = atlas_s_crash_hc.key,
   ranks = franks,
			display_ranks = franks,
   pos_style = 'collab'
  },
  {
   loc_txt =  "N. Sane",
   hc_default = false,
   key = "spades_cd",
   atlas = atlas_s_crash_cd.key,
   ranks = ranks,
			display_ranks = eranks,
   pos_style = 'ranks'
  },
 }
}