const order_list = JSON.parse(localStorage.getItem("order_list")) || [];
        const profile_id = JSON.parse(localStorage.getItem("profile_id"));
        const order_user = order_list.filter((e) => e.order_email == profile_id);
        console.log(order_user);

        const emptyCart = document.getElementById('cart_empty');
        const cartFull = document.getElementById('small_container');

        function showMessageDiv() {
            emptyCart.style.display = 'block';
            cartFull.style.display = 'none';
        }

        if (order_user.length === 0) {
            showMessageDiv();
        }

        for (const order of order_user) {
            const table = document.createElement("table");
            table.setAttribute("id", "table_product");
            console.log(table);

            const caption = document.createElement("caption");
            table.append(caption);

            const row = document.createElement("tr");
            table.append(row);

            const header = document.createElement("th");
            row.append(header);

            const productData = document.createElement("td");
            row.append(productData);

            const cartInfo = document.createElement("div");
            cartInfo.setAttribute("class", "cart_info");
            productData.append(cartInfo);

            const productImg = document.createElement("img");
            productImg.setAttribute("src", order.ordered_items.image_url);
            productImg.setAttribute("data-id", order.order_uuid);
            productImg.setAttribute("class", "product_1");
            productImg.setAttribute("alt", "Compat camal brown sofa");
            cartInfo.appendChild(productImg);

            const productName = document.createElement("h3");
            productName.textContent = order.ordered_items.product_name;
            cartInfo.appendChild(productName);

            const orderDate = document.createElement("td");
            const inputDate = order.ordered_time.substr(0, 10);
            const date = new Date(inputDate);

            const months = [
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December",
            ];

            const month = months[date.getMonth()];
            const day = date.getDate();
            const year = date.getFullYear();

            orderDate.textContent = `Order on ${day} ${month}, ${year}`;
            row.appendChild(orderDate);

            const quantity = document.createElement("td");
            row.appendChild(quantity);

            const quantityInput = document.createElement("input");
            quantityInput.setAttribute("type", "number");
            quantityInput.setAttribute("value", order.ordered_items.product_quantity);
            quantityInput.setAttribute("disabled", "");
            quantity.appendChild(quantityInput);

            const price = document.createElement("td");
            price.textContent = "₹" + order.ordered_items.product_price;
            row.appendChild(price);


            const deliveryStatus = document.createElement("td");
            row.appendChild(deliveryStatus);

            const startTime = new Date(order.ordered_time);
            console.log(startTime);

            //date
            const endTime = new Date(
                startTime.getFullYear(),
                startTime.getMonth(),
                startTime.getDate() + 7, 0, 0, 0, 0);
            console.log(endTime);
            const now = new Date();

            if (endTime > now) {
                const order_list = JSON.parse(localStorage.getItem("order_list"));
                order.order_status = "On the Way";
                localStorage.setItem("order_list", JSON.stringify(order_list));


                const deliveryButton = document.createElement("button");
                deliveryButton.setAttribute("class", "btn btn_tertiary");
                deliveryButton.textContent = "On the Way";
                deliveryStatus.appendChild(deliveryButton);
            } else {
				 const deliveryButton = document.createElement("button");
                deliveryButton.setAttribute("class", "btn btn_primary");
                deliveryButton.textContent = "Delivered";
                deliveryStatus.appendChild(deliveryButton);
                
                const order_list = JSON.parse(localStorage.getItem("order_list"));
                order.order_status = "Delivered";
                localStorage.setItem("order_list", JSON.stringify(order_list));
            }
            document.querySelector("div.bottom_contain").append(table);
        }

        //URL Params
        const bookCovers = document.querySelectorAll(".product_1");
        bookCovers.forEach((bookCover) => {
            bookCover.addEventListener("click", (event) => {
                const person_data = bookCover.dataset.id;
                window.location.href = `./order_history.html?order_id=${person_data}`;
            });
        });

