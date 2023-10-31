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
