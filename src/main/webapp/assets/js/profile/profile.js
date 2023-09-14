let addressList = JSON.parse(localStorage.getItem("addressList"));
        let addressArray = addressList.filter((e) => e.user_email == profile_id);
        console.log(addressArray);

        for (const address of addressArray) {
            const newDiv = document.createElement('div');
            newDiv.classList.add('addressInfo');

            const span = document.createElement('span');
            span.classList.add('tooltip');
            newDiv.appendChild(span);

            const img = document.createElement('img');
            img.src = '../../assets/images/home_page/edit_icon.png';
            img.alt = 'edit icon';
            img.setAttribute('class', 'edit_icon');
            img.setAttribute('data-id', address['address_id']);
            span.appendChild(img);

            const table = document.createElement('table');
            table.classList.add('table_product');
            newDiv.appendChild(table);

            const tbody = document.createElement('tbody');
            table.appendChild(tbody);

            const tr = document.createElement('tr');
            tr.classList.add('tr_address');
            tbody.appendChild(tr);

            const td1 = document.createElement('td');
            td1.classList.add('idh4');
            tr.appendChild(td1);

            const h4 = document.createElement('h4');
            if (address['user_notes']) {
                h4.innerText = address['user_notes'];
                if (address['default_status']) {
                    h4.innerText += ' (default)';
                }
            } else {
                h4.innerText = 'Address';
                if (address['default_status']) {
                    h4.innerText += ' (default)';
                }
            }
            td1.appendChild(h4);

            const td2 = document.createElement('td');
            tr.appendChild(td2);

            const p1 = document.createElement('p');
            p1.setAttribute('class', 'address_td');
            p1.innerText = address['user_address'] + ' ' + address['user_city'] + ' ,  ' + address['user_state'] + ' ,  ' + address['user_country'] + ' - ' + address['user_code'];
            td2.appendChild(p1);

            const td3 = document.createElement('td');
            tr.appendChild(td3);

            const p2 = document.createElement('p');
            p2.setAttribute('id', 'address_td');
            p2.innerText = 'No' + ' : ' + address['user_no'];
            td3.appendChild(p2);

            const td4 = document.createElement('td');
            tr.appendChild(td4);

            const button1 = document.createElement('button');
            button1.setAttribute('class', 'btnDefault');
            button1.setAttribute('data-id', address['address_id']);
            button1.innerText = 'DELETE';
            if (address['default_status'] === true) {
                button1.style.display = 'none';
            }
            td4.appendChild(button1);

            if (address['default_status'] === false) {
                const button = document.createElement('button');
                button.setAttribute('class', 'setDefault');
                button.setAttribute('data-id', address['address_id']);
                button.innerText = 'SET AS DEFAULT';
                td4.appendChild(button);
            }

            document.querySelector('div.addressDiv').append(newDiv);
        }

        const bookCovers = document.querySelectorAll(".edit_icon");
        bookCovers.forEach((bookCover) => {
            bookCover.addEventListener("click", (event) => {
                const person_data = bookCover.dataset.id;
                window.location.href = `../order/edit_address.html?edit_address=${person_data}`;
            });
        });

        const default_add = document.querySelectorAll("button.setDefault");
        default_add.forEach(function (getID) {
            getID.addEventListener("click", function () {
                const { id } = this.dataset;
                localStorage.setItem("address_id", JSON.stringify(id));
                const add_uuid = JSON.parse(localStorage.getItem("address_id"));
                if (window.confirm("Are you sure you want to change this as your default address?")) {
                    let def_add = addressArray.find(e => e.default_status === true);
                    console.log(def_add);
                    def_add.default_status = false;
                    function find_data(e) {
                        return e.address_id === add_uuid;
                    }
                    const set_default = addressList.find(find_data);
                    console.log(set_default);
                    set_default.default_status = true;
                    localStorage.setItem("addressList", JSON.stringify(addressList));
                    window.location.reload();
                }
            })
        });

        const del_add = document.querySelectorAll("button.btnDefault");
        del_add.forEach(function (getID) {
            getID.addEventListener("click", function () {
                const { id } = this.dataset;
                localStorage.setItem("address_id", JSON.stringify(id));
                const add_uuid = JSON.parse(localStorage.getItem("address_id"));
                function find_data(e) {
                    return e.address_id === add_uuid;
                }
                const address_del = addressList.find(find_data);
                if (address_del.default_status === true) {
                    window.alert("This is your default address. Please change your default address to another address before deleting it.")
                }
                else {
                    if (window.confirm("Are you sure?")) {
                        const indexOfAddress = addressList.indexOf(address_del);
                        addressList.splice(indexOfAddress, 1);
                        localStorage.setItem("addressList", JSON.stringify(addressList));
                        window.location.reload();
                    }
                }
            })
        });
        let defaultUserAddress = addressArray.find((e) => e.default_status === true);
        console.log(defaultUserAddress);
        document.getElementById("user_address").innerHTML = defaultUserAddress.user_address;
        document.getElementById("user_state").innerHTML = defaultUserAddress.user_state;
        document.getElementById("user_country").innerHTML = defaultUserAddress.user_country;