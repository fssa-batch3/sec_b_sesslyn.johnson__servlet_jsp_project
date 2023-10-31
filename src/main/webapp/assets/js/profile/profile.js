	    one();
	    async function one() {
	    		await fetchDataAndUpdatePage();
	    }

	    let addressDetails = null;
	    let addressArray = null;

	    async function fetchDataAndUpdatePage() {
	    	try {
	    		const response = await fetch(`/minimalweb/order/address`);
	    		if (!response.ok) {
	    			console.log(`HTTP Error! Status: ${response.status}`);
	    			return;
	    		}

	    		const data = await response.json();
	    		addressDetails = data.data.addressDetails;

	    		if (addressDetails.length === 0) {
	    		} else if (addressDetails) {
	    			addressArray = addressDetails;
	    			console.log(addressArray);
	    			renderProducts(addressArray);
	    		}
	    	} catch (error) {
	    		console.error(error);
	    	}
	    }
	    
function renderProducts(addressArray){
	
    for (const address of addressArray) {
        const newDiv = document.createElement('div');
        newDiv.classList.add('addressInfo');

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
            h4.innerText = address.title;
            if (address.isDefault) {
                h4.innerText += ' (default)';
            }
        td1.appendChild(h4);

        const td2 = document.createElement('td');
        tr.appendChild(td2);

        const p1 = document.createElement('p');
        p1.setAttribute('class', 'address_td');
        p1.innerText = address.address + ' ' + address.city + ' ,  ' + address.state + ' ,  ' + address.country+ ' - ' + address.pincode;
        td2.appendChild(p1);

        const td3 = document.createElement('td');
        tr.appendChild(td3);

        const p2 = document.createElement('p');
        p2.setAttribute('id', 'address_td');
        p2.innerText = 'No' + ' : ' + address.phoneNumber;
        td3.appendChild(p2);

        const td4 = document.createElement('td');
        tr.appendChild(td4);

        const button1 = document.createElement('button');
        button1.setAttribute('class', 'btnDefault');
        button1.setAttribute('data-id', address.id);
        button1.innerText = 'DELETE';
        if (address.isDefault === true) {
            button1.style.display = 'none';
        }
        td4.appendChild(button1);

        if (address.isDefault === false) {
            const button = document.createElement('button');
            button.setAttribute('class', 'setDefault');
            button.setAttribute('data-id', address.id);
            button.innerText = 'SET AS DEFAULT';
            td4.appendChild(button);
        }

        document.querySelector('div.addressDiv').append(newDiv);
    }
    const path = window.location.origin + '/minimalweb';
    console.log(path);


    const default_add = document.querySelectorAll("button.setDefault");
    default_add.forEach(function (getID) {
        getID.addEventListener("click", async function () {
        	let addressId = this.getAttribute("data-id");
        	console.log(addressId);
            if (window.confirm("Are you sure you want to set this as your default address?")) {
                try {
                	const response = await fetch(`/minimalweb/order/address/default?addressId=${addressId}`);
                        if (response.ok) {
                        const data = await response.json();
                        if (data.status === 200) {
                            window.location.reload();
                        } else {

                            alert(data.message);
                        }
                    }
                } catch (error) {
                    console.error(error);
                }
            }
        });
    });

    const del_add = document.querySelectorAll("button.btnDefault");
    del_add.forEach(function (button) {
        button.addEventListener("click", async function () {
            if (window.confirm("Are you sure you want to delete this address?")) {
                let addressId = this.getAttribute("data-id"); 
                console.log(addressId);
                try{
                   const response = await fetch(`/minimalweb/order/address/delete?addressId=${addressId}`);
                    if (response.ok) {
                        const data = await response.json();
                        if (data.status === 200) {
                            window.location.reload();
                        } else {
                            alert(data.message);
                        }
                    }
                } catch (error) {
                    console.error(error);
                }
            }
        });
    });

    let defaultUserAddress = addressArray.find((e) => e.isDefault === true);
    document.getElementById("user_address").innerHTML = defaultUserAddress.address;
    document.getElementById("user_state").innerHTML = defaultUserAddress.state;
    document.getElementById("user_country").innerHTML = defaultUserAddress.country;
	    }