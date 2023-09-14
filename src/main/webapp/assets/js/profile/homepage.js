const queryString = window.location.origin;
                    console.log(queryString);
                    const interiorRow1 = `

                    <div class="interiors">
                    <a href="${queryString}/pages/living_room/page.html?chamber_name=living_room">
                        <img class="living" id="living" src="${queryString}/assets/images/home_page/living_room-icon.png"
                            alt="icon of every chamber" /></a>
                        <p><span class="color">L</span>iving Room</p>
                    </div>

                    <div class="interiors" id="inter-bedroom">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=bedroom"> <img class="bedroom"
                                src="${queryString}/assets/images/home_page/bedroom-icon.png" alt="icon of every chamber" /></a>
                        <p><span class="color">B</span>edroom</p>
                    </div>

                    <div class="interiors">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=kitchen"><img class="kitchen"
                                src="${queryString}/assets/images/home_page/modular kitchen-icon.png"
                                alt="icon of every chamber" /></a>
                        <p><span class="color">M</span>odular Kitchen</p>
                    </div>

                    <div class="interiors" id="inter-4">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=kids_area"><img class="sofa"
                                src="${queryString}/assets/images/home_page/kids_room.png" alt="icon of every chamber" /></a>
                        <p><span class="color">K</span>ids Area</p>
                    </div>
                     `
                    document.querySelector("#row1Interior").insertAdjacentHTML("afterbegin", interiorRow1);

                    const interiorRow2 = `
                    <div class="interiors">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=bathroom">
                        <img class="tv" src="${queryString}/assets/images/home_page/bathroom-icon.png"
                            alt="icon of every chamber" /></a>
                        <p><span class="color">B</span>athroom</p>
                    </div>

                    <div class="interiors">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=false_ceiling"><img class="wadrobe"
                                src="${queryString}/assets/images/home_page/false ceiling.png" alt="icon of every chamber" /></a>
                        <p class="wadrobe"><span class="color">F</span>alse Ceiling</p>
                    </div>

                    <div class="interiors">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=renovation"><img class="crockery"
                                src="${queryString}/assets/images/home_page/renovation.png" alt="icon of every chamber" /></a>
                        <p><span class="color">C</span>rockery Units</p>
                    </div>

                    <div class="interiors" id="inter-wadrobe">
                        <a href="${queryString}/pages/living_room/page.html?chamber_name=mobile_house"><img class="pooja"
                                src="${queryString}/assets/images/home_page/mobile-house.png" alt="icon of every chamber" /></a>
                        <p class="wadrobe-para"><span class="color">P</span>ooja Units</p>
                    </div>
                    `
                    document.querySelector("#row2Interior").insertAdjacentHTML("afterbegin", interiorRow2);


                    fetch("./footer.html")
                    .then(response => {
                        return response.text()
                    })
                    .then(data => {
                        document.getElementById("footer").innerHTML = data;
                    });