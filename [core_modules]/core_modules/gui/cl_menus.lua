Citizen.CreateThread(function()

    -- Main Base Menus
    WarMenu.CreateMenu("gunsmith", "Gunsmith")
    WarMenu.CreateMenu("doctors", "Doctors")
    WarMenu.CreateMenu("stables", "Stables")
    WarMenu.CreateMenu("clothingstore", "Clothing Store")
    WarMenu.CreateMenu("generalstore", "General Store")
    WarMenu.CreateMenu("butchers", "Butchers")

    -- Gunsmith Sub Menus
    WarMenu.SetSubTitle('gunsmith', 'Purchase and Modify weapons here')
    WarMenu.CreateSubMenu('revolvers', 'gunsmith', 'Revolvers')
    -- Navy Revolver $192.50
    -- Lemat Revolver $221.90
    -- Cattleman Revolver $35.00
    -- Double-Action Revolver $88.90
    -- Schofield Revolver $134.40
    -- Volcanic Pistol $270.00
    -- Semi-Automatic Pistol $537.00
    -- Mauser Pistol $600.00
    WarMenu.CreateSubMenu('repeaters', 'gunsmith', 'Repeaters')
    -- Evans Repeater $300.00
    -- Carbine Repeater $90.00
    -- Lancaster Repeater $243.00
    -- Litchfield Reapeater $348.00
    WarMenu.CreateSubMenu('rifles', 'gunsmith', 'Rifles')
    -- Varmint Rifle $72.00
    -- Springfield Rifle $156.00
    -- Bolt Action Rifle 216.00
    -- Rolling Block Rifle $411.00
    -- Carcano Rifle $456.00
    WarMenu.CreateSubMenu('shotguns', 'gunsmith', 'Shotguns')
    -- Rare Shotgun $258.00
    -- Sawed-Off Shotgun $100.00
    -- Double-Barreled Shotgun $185.00
    -- Pump-Action Shotgun $266.00
    -- Semi-Auto Shotgun $540.00
    -- Repeating Shotgun $434.00
    WarMenu.CreateSubMenu('bow', 'gunsmith', 'Bow')
    -- Bow $124.00
    -- WarMenu.CreateSubMenu('melee', 'gunsmith', 'Melee')
    -- --
    -- WarMenu.CreateSubMenu('throwables', 'gunsmith', 'Throwables')
    -- Doctors Sub Menus
    WarMenu.SetSubTitle('doctors', 'Purchase consumables')
    WarMenu.CreateSubMenu('tonics', 'doctors', 'Tonics')
    WarMenu.CreateSubMenu('stimulants', 'doctors', 'Stimulants')
    WarMenu.CreateSubMenu('horsecare', 'doctors', 'Horse Care')
    -- [[ Tonics ]] --
    -- Potent Health Cure $4.50
    -- Potent Bitters $5.00
    -- Potent Snake Oil $5.50
    -- Potent Miracle Tonic $7.00
    -- Health Cure $2.50
    -- Snake Oil $3.50
    -- Bitters $3.00
    -- Miracle Tonic $4.00
    -- [[ Stimulants ]] --
    -- Chewing Tobacco $6.00
    -- Candies $3.00
    -- Cocaine Gum $5.00
    -- Chocolate Bar $2.00
    -- [[ Horse Care ]] --
    -- Horse Medicine $1.50
    -- Potent Horse Medicine $3.00
    -- Hourse Stimulant $2.50
    -- Potent Horse Stimulant $4.00
    -- Horse Reviver $2.50

    -- Stables Sub Menus
    WarMenu.SetSubTitle('stables', 'Purchase and modify horses')
    WarMenu.CreateSubMenu('horses', 'stables', 'Horses')
    WarMenu.CreateSubMenu('riding', 'horses', 'Riding')
    -- Kentucky Saddler
    -- Morgan
    -- Tenessee Walker
    WarMenu.CreateSubMenu('draft', 'horses', 'Draft')
    -- Suffolk Punch
    -- Belgian
    -- Shire
    WarMenu.CreateSubMenu('race', 'horses', 'Race')
    -- Nokota
    -- Thoroughbred
    -- American Standardbred
    WarMenu.CreateSubMenu('war', 'horses', 'War')
    -- Ardennes
    -- Hungarian Halfbred
    -- Andalusian
    WarMenu.CreateSubMenu('work', 'horses', 'Work')
    -- Dutch Warmblood
    -- Appalossa
    -- American Paint
    WarMenu.CreateSubMenu('multi', 'horses', 'Multi')
    -- Missouri Fox Treotter
    -- Mustang
    -- Turkoman
    -- Breton
    -- Criollo
    -- Kladruber
    -- Norfolk Roadster
    WarMenu.CreateSubMenu('superior', 'horses', 'Superior')
    -- Arabian
    WarMenu.CreateSubMenu('saddles', 'stables', 'Saddles')
    WarMenu.CreateSubMenu('carts', 'stables', 'Wagons')

    -- General Store Sub Menus
    WarMenu.SetSubTitle('generalstore', 'Purchase and sell provisions')
    WarMenu.CreateSubMenu('provisions', 'generalstore', 'Provisions')
    WarMenu.CreateSubMenu('cannedfood', 'provisions', 'Canned Food')
    -- Canned Apricots
    -- Baked Beans
    -- Canned Kidney Beans
    -- Canned Peaches
    -- Canned Corned Beef
    -- Canned Sweetcorn
    -- Canned Peas
    -- Canned Pineapples
    -- Canned Strawberries
    -- Canned Salmon
    -- Assorted Salted Offal
    WarMenu.CreateSubMenu('freshfood', 'provisions', 'Fresh Food')
    -- Apple
    -- Carrot
    -- Corn
    -- Peach
    -- Pear
    -- Cheese Wedge
    -- Prime Beef Joint
    -- Tender Pork Loin
    -- Salted Beef
    -- Mature Venison Meat
    WarMenu.CreateSubMenu('drygoods', 'provisions', 'Dry Goods')
    -- Assorted Biscuits
    -- Bread Roll
    -- Chocolate Bar
    -- Ground Coffee
    -- Crackers
    -- Candies
    -- Classic Oatcakes
    WarMenu.CreateSubMenu('liquor', 'provisions', 'Liquor')
    -- Fine Brandy
    -- Gin
    -- Guarma Rum
    -- Kentucky Bourbon
    WarMenu.CreateSubMenu('tobacco', 'provisions', 'Tobacco')
    -- Cigar
    -- Chewing Tobacco
    -- Cigarettes
    -- Butchers Sub Menus
    WarMenu.CreateSubMenu('tonics', 'generalstore', 'Tonics')
    -- Health Cure $2.50
    -- Bitters $3.00
    -- Snake Oil $3.50
    -- Miracle Tonic $4.00
    -- Hair Pomade $1.50
    -- Cocaine Gum $5.00
    WarMenu.CreateSubMenu('ammunition', 'generalstore', 'Ammunition')
    -- Revolver Cartridges - Regular
    -- Revolver Cartridges - High Velocity
    -- Revolver Cartridges - Express
    -- Pistol Cartridges - Regular
    -- Pistol Cartridges - High Velocity
    -- Pistol Cartridges - Express
    -- Repeater Cartridges - Regular
    -- Repeater Cartridges - High Velocity
    -- Repeater Cartridges - Express
    -- Rifle Cartridges - Regular
    -- Rifle Cartridges - High Velocity
    -- Rifle Cartridges - Express
    -- Rifle Cartridges - Varmint
    -- Shotgun Shells - Regular
    -- Shotgun Shells - Slug
    -- Arrows
    WarMenu.CreateSubMenu('huntnfish', 'generalstore', 'Hunting & Fishing')
    -- Herbivore Bait
    -- Predator Bait
    -- Fishing Rod
    -- Live Worms
    -- Live Crickets
    -- Lake Lure
    -- River Lure
    -- Gun Oil
    -- Binoculars
    -- Swamp Lure
    -- Pocket Watch
    -- Motor and Pestle
    WarMenu.CreateSubMenu('horsecare', 'generalstore', 'Horse Care')
    -- Horse Medicine
    -- Potent Horse Medicine
    -- Horse Reviver
    -- Potent Horse Stimulant
    -- Horse Stimulant
    WarMenu.SetSubTitle('butchers', 'Sell fur, meat, and carcasus')
    WarMenu.CreateSubMenu('buy', 'butchers', 'Buy')
    WarMenu.CreateSubMenu('sell', 'butchers', 'Sell')

    --Barbers Sub Menus
    WarMenu.SetSubTitle('barbers', 'Change your appearance')
    WarMenu.CreateSubMenu('hair', 'barbers', 'Hair')
    WarMenu.CreateSubMenu('facialhair', 'barbers', 'Facial Hair')
    WarMenu.CreateSubMenu('dentistry', 'barbers', 'Dentistry')
    -- [[ Hair ]] --
    -- Bald $15.50
    -- Buzzed $15.50
    -- Neat Left Parted $12.00
    -- Swept Back $18.00
    -- Thinning $8.50
    -- Thick Centre Parted $13.50
    -- Long Right Parted $15.50
    -- Middle Parted Fade $14.00
    -- Short Peaked
    -- Rough Tied
    -- Rough Right Parted
    -- Wild balding
    -- Long Slicked Back
    -- Windswept
    -- Wild Chop
    -- Pompadour Fade
    -- Short Curly Afro
    -- Curly Afro
    -- Long Curly Afro
    -- Slicked Back Fade
    -- Knotted Bandana
    -- Shoulder Waves
    -- Curly Left Parted
    -- Short Dreadlocks
    -- Long Middle Parted
    -- Long Pony T ail
    -- Tied Shaved Sides
    -- Neat Centre Parted
    -- [[ Facial Hair ]] --
    -- Clean Shaven
    -- Stubble
    -- The Walrus
    -- The Barkeep
    -- The Professor
    -- The Chin Curtain
    -- The Sea Shanty
    -- The General
    -- The Woodman
    -- The Old Dutch
    -- The Box Hedge
    -- The Mutton
    -- The Noble
    -- The Arcadian
    -- The Reverend
    -- The Private
    -- The Goatee
    -- The Knightly
    -- The Count
    -- The Pioneer
    -- The Beaded
    -- The Archway
    -- THe Handhold
    -- The Enlightened
    -- The Two Shanks
    -- The Ruff
    -- [[ Dentistry ]] --
    -- The Chompers
    -- The Gilded
    -- Plump Wore Out
    -- The Hayseed
    -- The Long-Dead
    -- The Gummer
    -- The Yokel
end)





















-- Blacklisted Weapons:

-- Rollingblock Sniperrifle
-- Volcanic Revolver
-- Volcanic Sniper
-- Repeating Shotgun

-- Carbine Repeater w/ Scope