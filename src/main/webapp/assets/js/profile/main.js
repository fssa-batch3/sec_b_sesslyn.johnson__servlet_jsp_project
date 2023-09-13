// Product Crud
const product_crud = JSON.parse(localStorage.getItem("product_crud"));
if (!product_crud) {
  localStorage.setItem(
    "product_crud",
    JSON.stringify([
      {
        image_url: "https://ii2.pepperfry.com/media/catalog/product/j/o/494x544/jordan-lhs-sectional-sofa-in-blue-colour-by-muebles-casa-jordan-lhs-sectional-sofa-in-blue-colour-by-anyyeu.jpg",
        product_category: "Sofa",
        product_description: '*3+ Lounger and  2 pillows. *Brand : Muebles Casa. *Dimensions (In Centimeters) :Lounger: H 79 x W 183 x D 83; 2 Seater Sofa: H 79 x W 130 x D 83; 1 Seater Sofa : H 79 x W 56 x D 83. * Seating Height : 17. *Weight :  65kg. * Frame Material : Meranti Wood & Plywood,  Fabric: PolyCotton * 10 days replacement.  * Perfect for Living room.',
        product_discount: "5",
        product_quantity: 15,
        product_name: "Jordan Fabric Sofa",
        product_real: "46799",
        product_sell: 44499,
        product_uuid: "1197836f-70e3-4ddb-b95d-d2be9cdc9d05",
        product_warranty: "15 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://iili.io/HrBczWg.jpg",
        product_category: "Sofa",
        product_description:
          '*2 Sofa and 4 pillows. *Brand : Evok. *Dimensions (In Centimeters) : H 83 x W 292 x D 220. *Seating Height : 17.5. *Weight :  111kg. *Colour : Green and Sandal.  * Frame Material : Meranti Wood & Plywood,  Fabric: PolyCotton * 10 days replacement.  * Perfect for Living room.',
        product_discount: "58",
        product_quantity: 8,
        product_name: "Alden Leatherette Sofa",
        product_real: "107475",
        product_sell: 44990,
        product_uuid: "3de2af59-cced-4849-94e1-df3d4b91b907",
        product_warranty: "12 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://iili.io/HrjcBcl.jpg",
        product_category: "Sofa",
        product_description:'*3 + 2 Seater with 2 + 4 pillows. *Brand : Casacraft. *Dimensions (In Centimeters) : H 94 x W 213 x D 89. *Seating Height : 17. *Weight :  70kg. *Colour : Mint Green.  * Frame Material : Pine Wood,  Fabric: Cotton * 10 days replacement.  * Perfect for Living room.',
        product_discount: "35",
        product_quantity: 22,
        product_name: "Cane Connection Sofa Set",
        product_real: "123074",
        product_sell: 79998,
        product_uuid: "131bf114-6cd9-4e44-a395-64c2a7fab318",
        product_warranty: "36 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://ii2.pepperfry.com/media/catalog/product/p/r/1100x1210/prestige-gold-led-smart-voice-assist-chandelier-by-smartway-lightings-prestige-gold-led-smart-voice--0jxpam.jpg",
        product_category: "Chandelier",
        product_description:
          '*Brand : Smartway Lighting. *Bulb Recommended : 54 Watt. *Dimensions (In Centimeters) : 109 Cm (L) x 20 Cm (B) x 99 Cm (H). *Smart Devices Supported : Google Assistant and Amazon Alexa. * Weight : 0.4kg. * 10 days replacement. * Specifications : Natural White + Warm white + Cold white *Our experts will install it for you – No cost',
        product_discount: "9",
        product_quantity: 13,
        product_name: "Prestige Gold Chandelier",
        product_real: "29449",
        product_sell: 27449,
        product_uuid: "8a4cb8b7-d21d-48a0-bcce-d7fa1adb2ebf",
        product_warranty: "8 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://iili.io/HrB7QXs.jpg",
        product_category: "Chandelier",
        product_description:
          '*Brand : Smartway Lighting. *Overall Height of the Chandelier: 65" Lamp Height: 9", Lamp Diameter: 23.5", Ceiling Cup Diameter: 6", Ceiling Cup Height: 1",Cord Length: Upto 55". * Bulb holders : 1.  *Product Material : Metal frame in a matte gold finish. * Weight : 12.5kg. * 10 days replacement. *Our experts will install it for you – No cost',
        product_discount: "17",
        product_quantity: 15,
        product_name: "Foder pendant Chandelier",
        product_real: "41060",
        product_sell: 36954,
        product_uuid: "550e8400-e29b-41d4-a716-446655440000",
        product_warranty: "15 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://www.whiteteak.com/media/fishpig/webp/catalog/product/cache/4711786e6148f76a597e8e5d4560ca1d/h/l/hl69-10003_14_.webp",
        product_category: "Chandelier",
        product_description:
          '*Brand : Smartway Lighting. *Overall Dimensions-Height: Upto 215.5", Length: 42", Width: 42", Glass Dimension-Height: 17", Diameter: 4", Ceiling Plate Dimensions - Height: 2", Dimeter: 39.5", Cord Length: Adjustable upto 192". * Bulb holders : 20.  *Product Material : Metal Frame with Glass Jars. * Weight : 48kg. * 10 days replacement.  *Our experts will install it for you – No cost',
        product_discount: "12",
        product_quantity: 7,
        product_name: "Square Three layer Chandelier",
        product_real: "12000",
        product_sell: 10560,
        product_uuid: "123e4567-e89b-12d3-a456-426655440000",
        product_warranty: "16 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://iili.io/HrC2CI1.png",
        product_category: "Crockery Units",
        product_description:
        '*Brand : GUDSMITH. *Dimensions (In Centimeters) : H 281 x W 300 x D 84. *Weight : 100.5 KG. *Product Material : Made by White marble. * 10 days replacement. * Perfect for Dinning room. *Made of high-quality white marble',
        product_discount: "25",
        product_quantity: 25,
        product_name: "Units of White Layer Crockery",
        product_real: "35000",
        product_sell: 26250,
        product_uuid: "5aef0124-9664-4f2a-b4f2-59449a3f2d37",
        product_warranty: "30 Months' Warranty ",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://iili.io/HNgKczu.md.jpg",
        product_category: "Crockery Units",
        product_description:
        '*Brand : @home. *Dimensions (In Centimeters) : H 200 x W 180 x D 64. *Weight : 80.5 KG. *Product Material : Mahogany Frame with Glass Jars. * 10 days replacement. * Perfect for Dinning room. *Made of high-quality mahogany wood',
        product_discount: "20",
        product_quantity: 18,
        product_name: "Glass Layer Crockery Units",
        product_real: "35000",
        product_sell: 28000,
        product_uuid: "4762bbfc-8882-4458-952c-95bb0251f8ab",
        product_warranty: "23 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://ii3.pepperfry.com/media/catalog/product/z/e/1100x1210/zenith-book-case-in-columbian-walnut-finish-by-gudsmith-zenith-book-case-in-columbian-walnut-finish--8y7z4f.jpg",
        product_category: "Crockery Units",
        product_description:
          '*Brand : GUDSMITH. *Wood : Walnut *Dimensions (In Centimeters) : H 190 x W 119.9 x D 39.9. *Product Material : Made with Walnut wood. *Weight : 85.5 KG * 10 days replacement. * Perfect for Dinning room. *Made of high-quality walnut wood',
        product_discount: "37",
        product_quantity: 4,
        product_name: "Zenith Case in Walnut Finish",
        product_real: "51420",
        product_sell: 32138,
        product_uuid: "e2b5a16e-21cb-4093-b7ec-bbf29154000b",
        product_warranty: "26 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://lmsin.net/cdn-cgi/image/h=750,w=750,q=85,fit=cover/https://aaeff43fe32172cbcecc-ae2a4e9a8cbc330ede5588dedf56886e.lmsin.net/homecentre/1000011001662-1000011001661_01-2100.jpg",
        product_category: "Space Saving Furniture",
        product_description:
          '* Seat Cushion : Fixed, * Frame Material : Solid Wood * Seat Filling : Foam * Color : Brown * Type : Ottoman * Dimensions : Ottoman: 1.4 m x 0.4 m x 0.48 m * 10 days replacement. * Perfect for Living room. *Frame Material Type: Engineered Wood',
        product_discount: "15",
        product_quantity: 16,
        product_name: " Fabric Ottoman with Storage",
        product_real: "14284",
        product_sell: 12141,
        product_uuid: "e0f97bfe-e861-4efc-ac26-5205852540d1",
        product_warranty: "18 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://m.media-amazon.com/images/I/61MEp1jTfgS._SL1500_.jpg",
        product_category: "Space Saving Furniture",
        product_description:
          '* Coffee Table with 4 stools. *Brand : Indigo interiors. * Product Dimensions : 85D x 85W x 42H Centimeters. * Material : sheesham wood. * Colour : black wulnut. * 10 days replacement. * Perfect for Living room. *Frame Material Type: Engineered Wood',
        product_discount: "52",
        product_quantity: 6,
        product_name: " Sheesham Wood Coffee Table",
        product_real: "28999",
        product_sell: 13920,
        product_uuid: "f81d4fae-7dec-11d0-a765-00a0c91e6bf6",
        product_warranty: "19 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://m.media-amazon.com/images/I/71SmYA9moiL._SL1500_.jpg",
        product_category: "Space Saving Furniture",
        product_description:
          '*Shape :	L-Shape, *Desk design :	Computer Desk, *Product Dimensions : 75D x 59.2W x 73H Centimeters, *Colour :	Black, * 10 days replacement. * Sectional Sofa Length = 105.5". * Our experts will install it for you – No cost. * Tearproof, Water Resistant. * Perfect for Living room.',
        product_discount: "20",
        product_quantity: 12,
        product_name: "Wall Mounted Study Table",
        product_real: "25000",
        product_sell: 20000,
        product_uuid: "5a6f0c3d-b4d4-4c21-9bf4-c069d78517c8",
        product_warranty: "22 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://iili.io/Hrn3lmN.png",
        product_category: "Wadrobe",
        product_description:
          '*Brand : Trevi Furniture. * Colour : Black. * Dimensions (In Centimeters) : H 180 x W 72 x D 47. *Weight : 300 KG. * 10 days replacement. * Perfect for Bedroom. *Simple and timeless design with an elegant finish',
        product_discount: "15",
        product_quantity: 25,
        product_name: "Wenge-finished Black Wardrobe",
        product_real: "45999",
        product_sell: 39099,
        product_uuid: "d3572eed-e216-419a-909d-5a7dbf5950b5",
        product_warranty: "18 Months' Warranty",
        sellerId: "admin@gmail.com",
      },
     
      {
        image_url: "https://iili.io/Hrn3zzP.png",
        product_category: "Wadrobe",
        product_description:
          '*Brand : Woodbuzz. * Colour : White. * Dimensions (In Centimeters) : H 180 x W 180 x D 48. *Weight : 165 KG. * 10 days replacement. * Perfect for Bedroom. *Simple and timeless design with an elegant finish',
        product_discount: "14",
        product_quantity: 5,
        product_name: "Frosty White Finish Wadrobe",
        product_real: "34999",
        product_sell: 30099,
        product_uuid: "38b9c9dc-ec16-41d2-8e87-09e69bcf2c7e",
        product_warranty: "36 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://ii2.pepperfry.com/media/catalog/product/e/l/1100x1210/elite-4-door-wardrobe-in-brown-and-grey-colour-by-maheshwari-furniture-elite-4-door-wardrobe-in-brow-dd7s77.jpg",
        product_category: "Wadrobe",
        product_description:
        '*Brand : Maheshwari Furniture. * Colour : Brown and Grey. * Dimensions (In Centimeters) : H 196 x W 201 x D 61. *Weight : 230 KG. * 10 days replacement. * Perfect for Bedroom. *Simple and timeless design with an elegant finish',
        product_discount: "15",
        product_quantity: 18,
        product_name: "Brown and Grey Finish Wardrobe",
        product_real: "48999",
        product_sell: 41649,
        product_uuid: "2d7c9e62-34f7-4c12-a8f7-6f41a6b0c325",
        product_warranty: "12 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://m.media-amazon.com/images/I/71N-j5RdPwL._SX679_.jpg",
        product_category: "Wallpaper",
        product_description:
          '*Brand :	Home Mark. * Colour : Black. * Material :	Vinyl * Product Dimensions :	60L x 200W Centimeters * Bluish Green Wallpaper. * 5 days replacement. * Tearproof, Water Resistant. *Wipes Clean With A Damp Cloth Or Sponge.',
        product_discount: "20",
        product_quantity: 15,
        product_name: "Black Marble Sticker Wallpaper",
        product_real: "699",
        product_sell: 629,
        product_uuid: "ebd9f9cc-7e11-4521-8b8d-f34f43b7aeb4",
        product_warranty: "3 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://m.media-amazon.com/images/I/71e0RPlYdhL._SX679_.jpg",
        product_category: "Wallpaper",
        product_description:
          '*Material :	Vinyl, Paper, Polyvinyl Chloride. * Colour : Green. * Brand	: ANNA CREATIONS. * Item Weight	: 246 Grams. *Size and feature : 45"X 304" CM. * Material : Vinyl. * 5 days replacement. * Tearproof, Water Resistant. *Wipes Clean With A Damp Cloth Or Sponge.',
        product_discount: "10",
        product_quantity: 8,
        product_name: "Vinyl Green Wallpaper",
        product_real: "999",
        product_sell: 899,
        product_uuid: "d8f9d9b7-efb2-4557-b929-0c2f7bc2efb3",
        product_warranty: "2 Months' Warranty",
        sellerId: "admin@gmail.com",
      },

      {
        image_url: "https://ii3.pepperfry.com/media/catalog/product/m/u/1100x1210/multicolour-triangles-wallpaper-by-the-wall-chronicles-multicolour-triangles-wallpaper-by-the-wall-c-1z7htp.jpg",
        product_category: "Wallpaper",
        product_description:
          '*Brand : The Wall Chronicles. *Dimensions : Width : 40, Height :120. *Colour : Multicolour. *Weight : 7 Kg. * 5 days replacement. * Tearproof, Water Resistant. * Perfect for Bedroom. *Wipes Clean With A Damp Cloth Or Sponge.',
        product_discount: "5",
        product_quantity: 10,
        product_name: "Multicolour Triangles Wallpaper",
        product_real: "6000",
        product_sell: 5700,
        product_uuid: "ac49cacb-1804-4cfb-aa1b-9d64c8ba351e",
        product_warranty: "4 Months' Warranty",
        sellerId: "admin@gmail.com",
      }

    ])
  );
}

// Added products
const added_products = JSON.parse(localStorage.getItem("added_products"));
if (!added_products) {
  localStorage.setItem(
    "added_products",
    JSON.stringify([
      { product_uuid: "2d7c9e62-34f7-4c12-a8f7-6f41a6b0c325" },
      { product_uuid: "d8f9d9b7-efb2-4557-b929-0c2f7bc2efb3" },
      { product_uuid: "ebd9f9cc-7e11-4521-8b8d-f34f43b7aeb4" },
      { product_uuid: "ac49cacb-1804-4cfb-aa1b-9d64c8ba351e" },
      { product_uuid: "1197836f-70e3-4ddb-b95d-d2be9cdc9d05" },
      { product_uuid: "3de2af59-cced-4849-94e1-df3d4b91b907" },
      { product_uuid: "131bf114-6cd9-4e44-a395-64c2a7fab318" },
      { product_uuid: "8a4cb8b7-d21d-48a0-bcce-d7fa1adb2ebf" },
      { product_uuid: "5aef0124-9664-4f2a-b4f2-59449a3f2d37" },
      { product_uuid: "123e4567-e89b-12d3-a456-426655440000" },
      { product_uuid: "550e8400-e29b-41d4-a716-446655440000" },
      { product_uuid: "4762bbfc-8882-4458-952c-95bb0251f8ab" },
      { product_uuid: "e2b5a16e-21cb-4093-b7ec-bbf29154000b" },
      { product_uuid: "e0f97bfe-e861-4efc-ac26-5205852540d1" },
      { product_uuid: "f81d4fae-7dec-11d0-a765-00a0c91e6bf6" },
      { product_uuid: "5a6f0c3d-b4d4-4c21-9bf4-c069d78517c8" },
      { product_uuid: "d3572eed-e216-419a-909d-5a7dbf5950b5" },
      { product_uuid: "38b9c9dc-ec16-41d2-8e87-09e69bcf2c7e" }
    ])
  );
}

//Room Details for Shop page
const room_details = JSON.parse(localStorage.getItem("room_details"));
if (!room_details) {
  localStorage.setItem(
    "room_details",
    JSON.stringify([
      {
        id_div: "inter_column",
        id_img: "living",
        image: "https://iili.io/J9e2lX1.png",
        text: "Living Room",
        page_img: "https://iili.io/J9e3GZ7.png",
        page_id: "living_room",
      },
      {
        id_div: "inter_column_2",
        id_img: "bedroom",
        image: "https://iili.io/J9e2OXt.png",
        text: "Bedroom",
        page_img: "https://iili.io/J9eFkUG.png",
        page_id: "bedroom",
      },
      {
        id_div: "inter_column",
        id_img: "kitchen",
        image: "https://iili.io/J9e2sh7.png",
        text: "Kitchen",
        page_img: "https://iili.io/J9eF294.png",
        page_id: "kitchen",
      },
      {
        id_div: "inter_column_2",
        id_img: "kids",
        image: "https://iili.io/J9e2tEu.png",
        text: "Kids Area",
        page_img: "https://iili.io/J9eFJSf.png",
        page_id: "kids_area",
      },
      {
        id_div: "inter_column",
        id_img: "bathroom",
        image: "https://iili.io/J9e2ykQ.png",
        text: "Bathroom",
        page_img: "https://iili.io/J9eFels.png",
        page_id: "bathroom",
      },
      {
        id_div: "inter_column_2",
        id_img: "bathroom",
        image: "https://iili.io/J9e3dhP.png",
        text: "False Ceiling",
        page_img: "https://iili.io/J9eFHcG.png",
        page_id: "false_ceiling",
      },
      {
        id_div: "inter_column",
        id_img: "renovation",
        image: "https://iili.io/J9e3KEg.png",
        text: "Renovation",
        page_img: "https://iili.io/J9e3Un1.png",
        page_id: "renovation",
      },
      {
        id_div: "inter_column_2",
        id_img: "mobile",
        image: "https://iili.io/J9e3CYv.png",
        text: "Mobile House",
        page_img: "https://iili.io/J9e38ZP.png",
        page_id: "mobile_house",
      },
    ])
  );
}

//Shopping Product
const shoppingProduct = JSON.parse(localStorage.getItem("shoppingProduct"));
if (!shoppingProduct) {
  localStorage.setItem(
    "shoppingProduct",
    JSON.stringify([
      { id_div: "inter_column", id_img: "sofa", image: "https://iili.io/J9eKX7j.png", text: "Sofa", page_id: "sofa" },
      { id_div: "inter_column_2", id_img: "wallpaper", image: "https://iili.io/J9eKhkx.png", text: "Wallpaper", page_id: "wallpaper" },
      { id_div: "inter_column", id_img: "chandelier", image: "https://iili.io/J9eK8EF.png", text: "Chandelier", page_id: "chandelier" },
      { id_div: "inter_column_2", id_img: "reusable", image: "https://iili.io/J9eKrYJ.png", text: "Space Saving Furniture", page_id: "reusable_products", },
      { id_div: "inter_column", id_img: "wadrobe", image: "https://iili.io/J9eKrYJ.png", text: "Wadrobe", page_id: "wadrobe", },
      { id_div: "inter_column_2", id_img: "crockery", image: "https://iili.io/J9eKpYG.png", text: "Crockery Units", page_id: "crockery_units", }
    ])
  );
}

//Room Details for product view page
const roomDetails = JSON.parse(localStorage.getItem("roomDetails"));
if (!roomDetails) {
  localStorage.setItem(
    "roomDetails",
    JSON.stringify([
      { yearBuilt: 2022, designer : "Sunita Kohli", catchyName1: "Notable", catchyName2: "Stylish", apartmentName: "Neighborly Nest", place: "Koyembadu", image: "https://images.pexels.com/photos/6058444/pexels-photo-6058444.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", roomCategory: "living_room", about:"It was created using the shades of Eerie Black and Cafe Noir. It was notable for our designer and one of the most stylish ones in our history.  Ronaldo Chesterfield Sofa Set was the couch. A wooden wall stand for the television was provided, and the chandelier was a double ring light chandelier.This room's budget is only ₹40000.",productImg:"https://ii2.pepperfry.com/media/catalog/product/p/r/1100x1210/prestige-gold-led-smart-voice-assist-chandelier-by-smartway-lightings-prestige-gold-led-smart-voice--0jxpam.jpg" },
      { yearBuilt: 2020, designer : "Manit Rastogi", catchyName1: "Luxurious", catchyName2: "Opulent", apartmentName: "Sunrise Apartments", place: "Guindy", image: "https://iili.io/J9eff4e.jpg", roomCategory: "living_room",about:"The sofa was replaced with an Italian leather sofa as part of a total renovation of the home. We replaced the tea table with a new one that we have storage units with it, a gorgeous photo frame stand, and a floor standing lamp that was created by our designer and his team on a shoestring budget. It was designed in a  luxurious and opulent environment.",productImg:"https://www.whiteteak.com/media/fishpig/webp/catalog/product/cache/4711786e6148f76a597e8e5d4560ca1d/h/l/hl69-10003_14_.webp" },
      { yearBuilt: 2021, designer : "Gauri Khan", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Ruby Apartments", place: "Velacherry", image: "https://iili.io/J9efzTQ.jpg", roomCategory: "living_room", about:"Living rooms are usually one of the largest rooms of a house, located either in the middle of a house or in the front (where they're often called 'front rooms'). The reason living rooms are more spacious is to accommodate large couches, TVs and entertainment centers, and other ornamental storage units.It was designed in the Modern style and had prestigious items all over.",productImg:"https://ii2.pepperfry.com/media/catalog/product/p/r/1100x1210/prestige-gold-led-smart-voice-assist-chandelier-by-smartway-lightings-prestige-gold-led-smart-voice--0jxpam.jpg"},
    
      { yearBuilt: 2020, designer : "Rajiv Saini", catchyName1: "Modern", catchyName2: "Comfortable", apartmentName: "Ruby Apartments", place: "Velacherry", image: "https://iili.io/J9efwas.jpg", roomCategory: "bathroom", about:"There are all the amenities in this tiny bathroom. It has a bathtub with a hand shower, a sink with a huge mirror and storage units underneath, a modern, comfortable toilet from the west, as well as a trash can. Mahogany wood was used for the floor, and a little light was added to create a relaxing bathing experience.",productImg:"https://hips.hearstapps.com/hmg-prod/images/toilet-1622659848.jpg" },
      { yearBuilt: 2021, designer : "Anjum Jung", catchyName1: "Contemporary ", catchyName2: "Chic", apartmentName: "Neighborly Nest", place: "Chengalpattu", image: "https://iili.io/J9efku4.jpg", roomCategory: "bathroom", about:"It is a chic, contemporary lavatory. There is a curtain hanger in the glassed shower area. a sizable bathtub with a hand shower and a shelf for storage. a tiny western toilet, a washbasin, a mirror for getting ready, and a storage container inside the washbasin. Excellent floor mat for drying our legs. with a white background to symbolise calm.",productImg:"https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,w_730/at%2Farchive%2F23b5c7346e8181e6bdf869b3e6ce73227283406f"},
      { yearBuilt: 2022, designer : "Sussanne Khan", catchyName1: "Classy", catchyName2: "Esteemed", apartmentName: "Sunrise Apartments", place: "Koyembadu", image: "https://iili.io/J9efe9f.jpg", roomCategory: "bathroom",about:"There are all the amenities in this tiny bathroom. It has a bathtub with a hand shower, a sink with a huge mirror and storage units underneath, a modern, comfortable toilet from the west, as well as a trash can. Mahogany wood was used for the floor, and a little light was added to create a relaxing bathing experience.",productImg:"https://hips.hearstapps.com/hmg-prod/images/toilet-1622659848.jpg" },

     
      { yearBuilt: 2021, designer : "Rajiv Saini", catchyName1: "Vibrant", catchyName2: "Fascinating", apartmentName: "Neighborly Nest", place: "Guindy", image: "https://iili.io/J9efboB.jpg", roomCategory: "kids_area", about:"It is a vibrant and fascinating bedroom that was created for a child to get him incredibly excited. It contains a shelf for storing items, a ladder to access the Baby Mattress Floral Print Bed, and a stand to display the child's artwork. We had a slide for him to use to exit the room, and a white, plush carpet to land on to keep him safe.",productImg:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrgsTvWj-qU5IReC-pP1WeFdcLK8Qx0qa8aw&usqp=CAU" },
      { yearBuilt: 2020, designer : "Anjum Jung", catchyName1: "Royal", catchyName2: "Joinery", apartmentName: "Sunrise Apartments", place: "Perungudi", image: "https://i.pinimg.com/736x/ba/ca/d0/bacad00670c706dfdebed5a07f0bf4fb.jpg", roomCategory: "kids_area", about:"It was a wooden-framed children's room with lots of cubbies for toy storage, a play area where parents could enjoy time with their children, and a babyhug single mattress with loads of ladders for amusement. The jute wall hanging chandelier in the room, which gives it a rustic appearance, especially at night, is one of its unique features.",productImg:"https://i.pinimg.com/236x/fd/3e/f8/fd3ef807f261700a250e32ec570f17c2--u-storage-baby-storage.jpg"},
      { yearBuilt: 2022, designer : "Sussanne Khan", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Ruby Apartments", place: "Koyembadu", image: "https://iili.io/J9eqHcg.jpg", roomCategory: "kids_area", about:"It was a wooden-framed children's room with lots of cubbies for toy storage, a play area where parents could enjoy time with their children, and a babyhug single mattress with loads of ladders for amusement. The jute wall hanging chandelier in the room, which gives it a rustic appearance, especially at night, is one of its unique features.",productImg:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrgsTvWj-qU5IReC-pP1WeFdcLK8Qx0qa8aw&usqp=CAU" },

      { yearBuilt: 2021, designer : "Gauri Khan", catchyName1: "Refined", catchyName2: "Trendy", apartmentName: "Neighborly Nest", place: "Valasaravakkam", image: "https://iili.io/Hr7oTL7.jpg", roomCategory: "kitchen", about:"This Kitchen is created with our minimalistic arts and features White as its primary colour. a small kitchen with a marble-topped dining table and movable chairs. The ceiling is lit by four LED chandeliers. A wall-mounted oven is present. The majority of the appliances are built-in, and the workspaces are simple to keep clean and maintain.It has a refined and trendy appearance.",productImg:"https://iili.io/HrC2CI1.png"},
      { yearBuilt: 2020, designer : "Manit Rastogi", catchyName1: "Attractive", catchyName2: "Royal", apartmentName: "Sunrise Apartments", place: "Guduvancherry", image: "https://images.pexels.com/photos/2398375/pexels-photo-2398375.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", roomCategory: "kitchen", about:"The dining table and stylish adjustable chairs were integrated into this kitchen. To gratify our customers, we have beautiful storage cabinets that had a marble appearance and some flower vases for freshness. According to the preferences of our customers, we used a chic washbasin and a dark, light theme. This room has a royal and attractive appearance.",productImg:"https://iili.io/HNgKczu.md.jpg"},
      { yearBuilt: 2022, designer : "Sunita Kohli", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Ruby Apartments", place: "Koyembadu", image: "https://iili.io/J9eqhxV.jpg", roomCategory: "kitchen", about: "This Kitchen is created with our minimalistic arts and features White as its primary colour. a small kitchen with a marble-topped dining table and movable chairs. The ceiling is lit by four LED chandeliers. A wall-mounted oven is present. The majority of the appliances are built-in, and the workspaces are simple to keep clean and maintain.It has a refined and trendy appearance.",productImg:"https://iili.io/HrC2CI1.png"},

      { yearBuilt: 2021, designer : "Sussanne Khan", catchyName1: "Affection", catchyName2: "Devotion", apartmentName: "Neighborly Nest", place: "Chrompet", image: "https://iili.io/J9eqtJs.jpg", roomCategory: "false_ceiling", about:"It is intended for our newlywed couples as a token of their devotion to one another. Our designers used a limited budget to carve and mend it. A two-heart with a beautiful light enhances the space. The lighting can be adjusted to suit our mood. We've added a range of colours to it.",productImg:"https://m.media-amazon.com/images/I/71N-j5RdPwL._SX679_.jpg" },
      { yearBuilt: 2020, designer : "Rajiv Saini", catchyName1: "Classy", catchyName2: "Astonished", apartmentName: "Sunrise Apartments", place: "Tambaram", image: "https://iili.io/J9eqD5G.jpg", roomCategory: "false_ceiling", about:"Its purpose is to improve the elegance of our living area. There are ten petals in the flowery motif. It can be controlled remotely and connected via wifi. It comes in a variety of hues. When you turn it off, the petals will reattach. It was a truly astounding piece of art created by our team.", productImg:"https://m.media-amazon.com/images/I/71e0RPlYdhL._SX679_.jpg"},
      { yearBuilt: 2022, designer : "Anjum Jung", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Ruby Apartments", place: "Perungaluthur", image: "https://iili.io/J9eqbef.jpg", roomCategory: "false_ceiling",about:"It is intended for our newlywed couples as a token of their devotion to one another. Our designers used a limited budget to carve and mend it. A two-heart with a beautiful light enhances the space. The lighting can be adjusted to suit our mood. We've added a range of colours to it.",productImg:"https://m.media-amazon.com/images/I/61MEp1jTfgS._SL1500_.jpg" },

      { yearBuilt: 2021, designer : "Gauri Khan", catchyName1: "Compact", catchyName2: "Tidy", apartmentName: "Neighborly Nest", place: "Velacherry", image: " https://images.pexels.com/photos/439227/pexels-photo-439227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", roomCategory: "bedroom" , about:"It was created for a college-going girl. Both under the bed and in a wall were storage units that we had. From flipkart, we purchased a single coir mattress. We created a fantastic study table out of a single piece of white marble that we purchased. To sit at the study table, we had a curved stool. It is a space-saving technique we apply in this room that is minimal cost.",productImg:"https://iili.io/Hrn3lmN.png"},
      { yearBuilt: 2020, designer : "Manit Rastogi", catchyName1: "Fashionable", catchyName2: "Orderly", apartmentName: "Sunrise Apartments", place: "Porur", image: "https://images.unsplash.com/photo-1540518614846-7eded433c457?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1714&q=80", roomCategory: "bedroom", about:"We created a master bedroom with an incredibly comfortable double mattress and cosy stools for the delightful lovers. Additionally, we imported a master pie wall hanger, a glassed floor light for either side of the bed, and plants to provide freshness. The photo painted frame is the bedroom's distinctive feature. Finally, we designated this space as a fashionable and orderly creation of Minimalistic designers.",productImg:"https://iili.io/Hrn3zzP.png"},
      { yearBuilt: 2022, designer : "Sunita Kohli", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Ruby Apartments", place: "Koyembadu", image: "https://iili.io/J9eBlXp.jpg", roomCategory: "bedroom", about:"It was created for a college-going girl. Both under the bed and in a wall were storage units that we had. From flipkart, we purchased a single coir mattress. We created a fantastic study table out of a single piece of white marble that we purchased. To sit at the study table, we had a curved stool. It is a space-saving technique we apply in this room that is minimal cost.",productImg:"https://iili.io/Hrn3zzP.png"},

      { yearBuilt: 2021, designer : "Manit Rastogi", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Neighborly Nest", place: "Kanchipuram", image: "https://iili.io/Hr7Our7.jpg", roomCategory: "renovation", about:"I'm excited to showcase this wonderful kitchen renovation job. At first, it had a rustic and drab appearance, but in a short amount of time, we completely transformed it with simple paintings, a new floor, the purchase of a gorgeous dining table and two chairs, a wall hanger we made out of scrap materials that gives the space an extra touch of class, and plants for freshness.",productImg:"https://m.media-amazon.com/images/I/71SmYA9moiL._SL1500_.jpg"},
      { yearBuilt: 2020, designer : "Gauri Khan", catchyName1: "Classy", catchyName2: "Glassy", apartmentName: "Sunrise Apartments", place: "Bangalore", image: "https://iili.io/J9eBjpf.jpg", roomCategory: "renovation", about:"I'm thrilled to tell you about this excellent home renovation project.Our talented designers transformed a plain and boring house into a chic and fashionable residence. We converted the house into a glass house in accordance with the clients' requests, adding a wooden sofa, a tea table, a dining table, and a television. The property looks elegant and classy thanks to a pattern floor mat and a rustic piece of wall art.",productImg:"https://m.media-amazon.com/images/I/61MEp1jTfgS._SL1500_.jpg"},
      { yearBuilt: 2022, designer : "Sunita Kohli", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Ruby Apartments", place: "Hyderabad", image: "https://iili.io/J9eBNI4.jpg", roomCategory: "renovation", about:"I'm excited to showcase this wonderful kitchen renovation job. At first, it had a rustic and drab appearance, but in a short amount of time, we completely transformed it with simple paintings, a new floor, the purchase of a gorgeous dining table and two chairs, a wall hanger we made out of scrap materials that gives the space an extra touch of class, and plants for freshness.",productImg:"https://m.media-amazon.com/images/I/71N-j5RdPwL._SX679_.jpg"},

      { yearBuilt: 2021, designer : "Anjum Jung", catchyName1: "Compact", catchyName2: "Elegant", apartmentName: "Caravan", place: "Chrompet", image: "https://iili.io/J9eBLQV.jpg", roomCategory: "mobile_house", about:"It is a truck house that was created for our young couples that enjoy exploring new places. For our clients, we provide a chic lounge space with extended storage cabinets. Additionally, there is a sink on the lounge's side. A windowed double mattress bed accessed by a rustic ladder. and improved the space by adding more windows and plants.",productImg:"https://lmsin.net/cdn-cgi/image/h=750,w=750,q=85,fit=cover/https://aaeff43fe32172cbcecc-ae2a4e9a8cbc330ede5588dedf56886e.lmsin.net/homecentre/1000011001662-1000011001661_01-2100.jpg" },
      { yearBuilt: 2020, designer : "Gauri Khan", catchyName1: "Clean", catchyName2: "Attractive", apartmentName: "Motor Home", place: "Velacherry", image: "https://iili.io/Hr7vhv9.png", roomCategory: "mobile_house", about:"In terms of truck house design, it is one of our best projects. A small living room with a TV unit and a ladder leading to the living room with a storage cabinet, which has a bed for their child underneath. a place in which to work quietly. a complete kitchen with all the amenities. and the main bedroom is located at the top.",productImg:"https://m.media-amazon.com/images/I/61MEp1jTfgS._SL1500_.jpg"},
      { yearBuilt: 2022, designer : "Sussanne Khan", catchyName1: "Modern", catchyName2: "Prestigious", apartmentName: "Van House", place: "Koyembadu", image: "https://iili.io/J9eBshQ.jpg", roomCategory: "mobile_house", about:"It is a truck house that was created for our young couples that enjoy exploring new places. For our clients, we provide a chic lounge space with extended storage cabinets. Additionally, there is a sink on the lounge's side. A windowed double mattress bed accessed by a rustic ladder. and improved the space by adding more windows and plants.",productImg:"https://m.media-amazon.com/images/I/61MEp1jTfgS._SL1500_.jpg"}

    ])
  );
}


//Designers Info
const designersInfo = JSON.parse(localStorage.getItem("designersInfo"));
const rootPath = window.location.origin;
if (!designersInfo) {
  localStorage.setItem(
    "designersInfo",
    JSON.stringify([
      {
        firstname: "Gauri", lastname:"Khan",profession: "Interior Designer", project: 1, team: 6, education: "BA in Interior Architecture and Design", designersId: "c36e1f3e-7e1c-4b78-9ae7-739d1ac2f6a2", link: rootPath + "/pages/living_room/product_view.html?chamber_name=bedroom",
        image: "https://c.ndtvimg.com/2020-09/s3rha1qo_gauri-khan_625x300_15_September_20.jpg", about: "Creative Interior Design with a strong background in project management, space planning, and computer-aided design . Expertise in coordinating all facets of design, from A&E approval to FF&E selection to final delivery. Proven success in leading multifunctional teams to achieve project goals and achieving a high degree of client satisfaction. Completed more than 50 projects all over India and completed 1 project in Minimalistic."
      },
      {
        firstname: "Manit ", lastname: "Rastogi", profession: "Interior Designer", project: 1, team: 2, education: "Bachelor of Interior Design", designersId: "92647d62-364e-4b42-aa0a-d67c6cf65fa5",link:rootPath +"/pages/living_room/product_view.html?chamber_name=renovation",
        image: "https://interiordesign.net/wp-content/uploads/2021/06/62080-Manit-Rastogi-Morphogenesis.jpg", about: "Skilled in conceptualizing and executing innovative designs that align with clients' visions and functional requirements. Proficient in utilizing design software, such as AutoCAD and 3D modeling tools, to develop detailed plans and visualizations. Effective communicator and collaborator, working closely with clients, architects, and contractors to ensure successful project completion. Completed more than 20 projects all over India and completed 1 project in Minimalistic."
      },
      {
        firstname: "Sunita", lastname:"Kohli", profession: "Lighting Expert", project: 1, team: 4, education: "B.Sc in Interior Designer.", designersId: "e15c48c6-8e3f-4c43-b8d2-3aef6741c9f1", link:rootPath +"/pages/living_room/product_view.html?chamber_name=living_room",
        image: "https://wikibio.in/wp-content/uploads/2022/08/Sunita-Kohli-picture.jpg", about: "Creative Interior Design with a strong background in project management, space planning, and computer-aided design . Expertise in coordinating all facets of design, from A&E approval to FF&E selection to final delivery. Proven success in leading multifunctional teams to achieve project goals and achieving a high degree of client satisfaction. Completed more than 35 projects all over India and completed 1 project in Minimalistic."
      },
      {
        firstname: "Rajiv" , lastname:"Saini", profession: "Consultant", project: 1, team: 3, education: "M.SC in Design Space", designersId: "f4809c6a-fa16-4c90-a7dd-ef92690648f3",link:rootPath +"/pages/living_room/product_view.html?chamber_name=kids_area",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4oXeP6p9LF6O3XsJGoH8x291UTRNapjqYtLxcl6XU_8qFFBiX", about: "Skilled in conceptualizing and executing innovative designs that align with clients' visions and functional requirements. Proficient in utilizing design software, such as AutoCAD and 3D modeling tools, to develop detailed plans and visualizations. Effective communicator and collaborator, working closely with clients, architects, and contractors to ensure successful project completion. Completed more than 40 projects all over India and completed 1 project in Minimalistic."
      },
      {
        firstname: "Anjum", lastname:"Jung", profession: "Landscape Architect", project: 1, team: 4, education: "BE in Architecture Engineering", designersId: "7e22d8ad-9324-4b5b-a1f9-7e48a8161b02",link:rootPath +"/pages/living_room/product_view.html?chamber_name=mobile_house",
        image: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTVuGhaTLL3yOiZr99eyR0-qabxi77ih5dj-lRJ_A1AI_4ELHWe", about: "Creative Interior Design with a strong background in project management, space planning, and computer-aided design . Expertise in coordinating all facets of design, from A&E approval to FF&E selection to final delivery. Proven success in leading multifunctional teams to achieve project goals and achieving a high degree of client satisfaction. Completed more than 54 projects all over India and completed 1 project in Minimalistic."
      },
      {
        firstname: "Sussanne ", lastname:"Khan", profession: "Design Executive", project: 1, team: 5, education: "B.Des Interior Design", designersId: "542de8c8-5d3d-4a7a-9309-89c8c0e7a0bc",link:rootPath +"/pages/living_room/product_view.html?chamber_name=false_ceiling",
        image: "https://static.abplive.com/wp-content/uploads/2020/12/23045559/Sussanne-Khan.jpeg?impolicy=abp_cdn&imwidth=640", about: "Skilled in conceptualizing and executing innovative designs that align with clients' visions and functional requirements. Proficient in utilizing design software, such as AutoCAD and 3D modeling tools, to develop detailed plans and visualizations. Effective communicator and collaborator, working closely with clients, architects, and contractors to ensure successful project completion. Completed more than 32 projects all over India and completed 1 project in Minimalistic."
      }
    ])
  )
};

const project_designer = JSON.parse(localStorage.getItem("project_designer"));
if (!project_designer) {
  localStorage.setItem(
    "project_designer",
    JSON.stringify([
      {
        designersId: "542de8c8-5d3d-4a7a-9309-89c8c0e7a0bc", 
      }
    ])
  )
};
