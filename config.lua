Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableMoneyWash            = true
Config.MaxInService               = -1
Config.Locale                     = 'fr'

Config.MissCraft                  = 10 -- %

Config.AuthorizedVehicles = {
    { name = 'stalion2',  label = 'Stalion BurgerShot' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = -1183.7126464844, y = -884.37322998047, z = 13.799719810486 },
      Sprite  = 106,
      Display = 4,
      Scale   = 1.2,
      Colour  = 59,
    },
}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -1200.5029296875, y = -890.33709716797, z = 12.995155334473 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Name  = "Vestiaire",
        Type  = 0
    },

    Vaults = {
        Pos   = { x = -1202.5881347656, y = -894.40582275391, z = 12.99516487126 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Name  = "Coffre",
        Type  = 0
    },

    Fridge = {
        Pos   = { x = -1196.6790771484, y = -894.33947753906, z = 12.995160102844 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Name  = "Frigo",
        Type  = 0
    },

    PreparationSteak = {
        Pos   = { x = -1196.6790771484, y = -894.33947753906, z = 12.995160102844 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Name  = "Cuire steak",
        Type  = 0
    },

    Vehicles = {
        Pos          = { x = -1177.3461914063, y = -890.84027099609, z = 12.791997909546 },
        SpawnPoint   = { x = -1174.3291015625, y = -889.08239746094, z = 13.893969535828 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Name  = "Garage véhicule",
        Type  = 0,
        Heading      = 207.43,
    },

    VehicleDeleters = {
        Pos   = { x = -1165.5532226563, y = -887.93658447266, z = 13.130926132202 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Name  = "Ranger le vehicule",
        Type  = 0
    },

    BossActions = {
        Pos   = { x = -1194.7763671875, y = -900.59460449219, z = 12.99515914917 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
       Name  = "Menu patron",
        Type  = 0
    },

    KetchupFarm = {
        Pos   = { x = 1190.064, y = -3106.073, z = 4.160 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Name  = "Récupérer marchandises",
        Type  = 1
    },

    SachetKetchup = {
        Pos   = { x = 2461.572, y = 1589.279, z = 32.000 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Name  = "Mise en sachet",
        Type  = 1
    },

    SellFarm = {
        Pos   = { x = 1719.426, y = 4759.067, z = 40.940 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Name  = "Vente",
        Type  = 1
    },

-----------------------
-------- SHOPS --------

    Alim = {
        Pos   = { x = -1179.884765625, y = -902.48187255859, z = 12.549982070922 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Name = "Boutique",
        Type  = 0,
        Items = {
            { name = 'salads',      label = _U('salads'),   price = 3 },
            { name = 'tomater',      label = _U('tomater'),   price = 2 },
            { name = 'steakc',       label = _U('steakc'),    price = 7 },
            { name = 'bread',     label = _U('bread'),  price = 2 },
            { name = 'fromage',    label = _U('fromage'), price = 3 },
            { name = 'patate',    label = _U('patate'), price = 3 },
            { name = 'soda',        label = _U('soda'),     price = 4 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
            { name = 'energy',      label = _U('energy'),   price = 7 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 1 }
        },
    },

}


Config.Uniforms = {
  burgershot_outfit = {
   male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 281,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 24,
        ['pants_1'] = 35,   ['pants_2'] = 0,
        ['shoes_1'] = 26,    ['shoes_2'] = 1,
        ['chain_1'] = 0,    ['chain_2'] = 0
    },
        female = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 281,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 24,
        ['pants_1'] = 35,   ['pants_2'] = 0,
        ['shoes_1'] = 26,    ['shoes_2'] = 1,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  }
}
