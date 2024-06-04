<!DOCTYPE html>
<html lang="uk">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Рієлторська компанія. Виконав Сіденко Дмитро ІН-302</title>
    <link rel="icon" href="img/logoHead.png" type="image/png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="css/mapStyles.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <script async
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&loading=async&libraries=places&callback=initMap">
        </script>
    <style>
        .pac-container {
            z-index: 9999999 !important;
        }
    </style>
</head>

<body>
    <!-- Навігаційне меню -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark position-relative sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand ms-5" href="#">
                <img src="img/logo.png" class="mr-3" alt="Рієлторська компанія" height="40">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-center me-3" href="#">Головна</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-center me-3" href="#">Нерухомість</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-center me-5" href="#">Контакти</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-secondary text-white active me-5" href="#" data-bs-toggle="modal"
                            data-bs-target="#addEstateModal">Додати оголошення</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Основний контент -->
    <div class="container-fluid mt-3">
        <div class="row">

            <!-- Контент ліворуч -->
            <div class="col-md-6">
                <div class="row">
                    <div id="estateList">
                        <?php
                        include ("form/con_bd.php");
                        $query = "
                        SELECT e.estate_ID, e.address, e.floor, e.number_of_rooms, e.space, e.year_of_construction, e.description, e.latitude, e.longitude, e.cost, o.phone, r.repair_name
                        FROM estate e
                        JOIN owner o ON e.owner_ID = o.owner_ID
                        JOIN repair r ON e.repair_ID = r.repair_ID";
                        $result = mysqli_query($link, $query);
                        $estates = [];
                        if ($result) {
                            while ($row = mysqli_fetch_array($result)) {
                                $estates[] = $row;
                                echo '<div class="col-md-12 mb-4">';
                                echo '    <div class="card">';
                                echo '        <div class="row no-gutters">';
                                echo '            <div class="col-md-6">';
                                echo '                <div id="carouselEstate' . $row['estate_ID'] . '" class="carousel slide" data-bs-ride="carousel">';
                                echo '                    <div class="carousel-inner rounded-start overflow-hidden">';
                                echo '                        <div class="carousel-item active">';
                                echo '                            <img src="https://img.rieltor.ua/crop/1500x1000/offers/842/42/2/1793961189586842.jpg" class="d-block w-100" alt="Фото нерухомості">';
                                echo '                        </div>';
                                echo '                        <div class="carousel-item">';
                                echo '                            <img src="https://img.rieltor.ua/crop/750x500/offers/458/58/8/1793961189353458.jpg" class="d-block w-100" alt="Фото нерухомості">';
                                echo '                        </div>';
                                echo '                    </div>';
                                echo '                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselEstate' . $row['estate_ID'] . '" data-bs-slide="prev">';
                                echo '                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>';
                                echo '                        <span class="visually-hidden">Previous</span>';
                                echo '                    </button>';
                                echo '                    <button class="carousel-control-next" type="button" data-bs-target="#carouselEstate' . $row['estate_ID'] . '" data-bs-slide="next">';
                                echo '                        <span class="carousel-control-next-icon" aria-hidden="true"></span>';
                                echo '                        <span class="visually-hidden">Next</span>';
                                echo '                    </button>';
                                echo '                </div>';
                                echo '            </div>';
                                echo '            <div class="col-md-6">';
                                echo '                <div class="card-body">';
                                echo '                    <h5 class="card-title"><b>' . round($row['cost']) . ' $</b></h5>';
                                echo '                    <p class="card-text mb-1 text-truncate"><small class="text-muted">' . $row['address'] . '</small></p>';
                                echo '                    <p class="card-text mb-1 text-truncate">' . $row['description'] . '</p>';
                                echo '                    <div class="row">';
                                echo '                        <div class="col-6">';
                                echo '                            <ul class="list-unstyled">';
                                echo '                                <li class="mb-1"><img src="img/room.svg" alt="Кількість кімнат" title="Кількість кімнат"> ' . $row['number_of_rooms'] . ' кімнати</li>';
                                echo '                                <li class="mb-1"><img src="img/square.svg" alt="Площа" title="Площа"> ' . $row['space'] . ' м²</li>';
                                echo '                                <li class="mb-1"><img src="img/floor.svg" alt="Поверх" title="Поверх"> ' . $row['floor'] . ' поверх</li>';
                                echo '                            </ul>';
                                echo '                        </div>';
                                echo '                        <div class="col-6">';
                                echo '                            <ul class="list-unstyled">';
                                echo '                                <li class="mb-1"><img src="img/repair.svg" alt="Ремонт" title="Ремонт"> ' . $row['repair_name'] . '</li>';
                                echo '                                <li class="mb-1"><img src="img/colendar.svg" alt="Рік побудови" title="Рік побудови"> ' . $row['year_of_construction'] . '</li>';
                                echo '                                <li class="mb-1"><img src="img/phone.svg" alt="Телефон" title="Телефон"> ' . $row['phone'] . '</li>';
                                echo '                            </ul>';
                                echo '                        </div>';
                                echo '                    </div>';
                                echo '                </div>';
                                echo '            </div>';
                                echo '        </div>';
                                echo '    </div>';
                                echo '</div>';
                            }
                        } else {
                            echo "No results found.";
                        }
                        ?>
                    </div>

                    <!-- Пагінація -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center text-dark">
                            <li class="page-item">
                                <a class="page-link text-dark border-0 fw-bold" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a
                                    class="page-link text-white bg-dark border-0 rounded-circle fw-bold ms-2 active"
                                    href="#">1</a></li>
                            <li class="page-item"><a class="page-link text-dark border-0 fw-bold ms-2" href="#">2</a>
                            </li>
                            <li class="page-item"><a class="page-link text-dark border-0 fw-bold ms-2" href="#">3</a>
                            </li>
                            <li class="page-item">
                                <a class="page-link text-dark border-0 fw-bold ms-2" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>


            <!-- Карта -->
            <div class="col-md-6">
                <div id="map" class="position-fixed top-50 end-0 translate-middle-y w-50 h-100 d-none d-md-block"></div>
            </div>
        </div>
    </div>

    <!-- Футер -->
    <footer class="bg-dark text-center mt-2 sticky-top">
        <div class="container p-2">
            <p class="text-center text-white">© 2024 Рієлторська компанія. Виконав Сіденко Дмитро ІН-302.</p>
        </div>
    </footer>

    <!-- Модальне вікно -->
    <div class="modal fade" id="addEstateModal" tabindex="-1" role="dialog" aria-labelledby="addEstateModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addEstateModalLabel">Додати нерухомість</h5>
                </div>
                <div class="modal-body">
                    <form id="estate_form" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group mb-2">
                                    <label for="estate_type">Тип нерухомості</label>
                                    <select class="form-control" id="estate_type" name="estate_type">
                                        <option value="1">Котедж</option>
                                        <option value="2">Квартира</option>
                                        <option value="3">Земельна ділянка</option>
                                        <option value="4">Гараж/Стоянка</option>
                                    </select>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="repair_type">Тип ремонту</label>
                                    <select class="form-control" id="repair_type" name="repair_type">
                                        <option value="1">Косметичний</option>
                                        <option value="2">Капітальний</option>
                                        <option value="3">Без ремонту</option>
                                        <option value="4">Реконструкція</option>
                                    </select>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="address">Адреса</label>
                                    <input type="text" class="form-control" id="address" name="address"
                                        placeholder="Введіть адресу">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="floor">Поверх</label>
                                    <input type="number" class="form-control" id="floor" name="floor"
                                        placeholder="Введіть поверх">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="number_of_rooms">Кількість кімнат</label>
                                    <input type="number" class="form-control" id="number_of_rooms"
                                        name="number_of_rooms" placeholder="Введіть кількість кімнат">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group mb-2">
                                    <label for="space">Площа</label>
                                    <input type="number" class="form-control" id="space" name="space"
                                        placeholder="Введіть площу">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="year_of_construction">Рік побудови</label>
                                    <input type="number" class="form-control" id="year_of_construction"
                                        name="year_of_construction" placeholder="Введіть рік побудови">
                                </div>
                                <div class="form-group mb-2">
                                    <label for="description">Опис</label>
                                    <textarea class="form-control" id="description" name="description" rows="4"
                                        placeholder="Введіть опис"></textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="cost">Вартість</label>
                                    <input type="number" class="form-control" id="cost" name="cost"
                                        placeholder="Введіть вартість">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="latitude" name="latitude">
                        <input type="hidden" id="longitude" name="longitude">


                        <div class="clear"></div>
                        <div class="form-row  col-md-12">
                            <h3 class="text-center">
                                <div id="error" class="text-center" style="color: #ff0000; "></div>
                            </h3>
                        </div>
                        <button type="submit" class="btn btn-primary">Додати</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>

        // Реалізація Autocomplete
        var autocomplete;

        function initAutocomplete() {
            var searchInput = 'address';
            autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
                types: ['geocode'],
            });

            google.maps.event.addListener(autocomplete, 'place_changed', function () {
                var place = autocomplete.getPlace();
            });
        }

        $(document).ready(function () {
            $('#addEstateModal').on('shown.bs.modal', function () {
                initAutocomplete();
            });
        });

        var map;
        // Збереження координат нерухомостей в змінну JavaScript
        var estates = <?php echo json_encode($estates); ?>;



        // Карта
        function initMap() {
            var opt = {
                center: { lat: 50.454819, lng: 30.519517, },
                zoom: 11,
                styles: styles,
                panControl: false,
                zoomControl: false,
                mapTypeControl: false,
                scaleControl: false,
                streetViewControl: false,
                overviewMapControl: false,
                rotateControl: false,
                gestureHandling: "greedy",
                scrollwheel: true,
            };

            var map = new google.maps.Map(document.getElementById("map"), opt);

            // Додавання маркерів на карту
            estates.forEach(function (estate) {
                var latitude = parseFloat(estate.latitude);
                var longitude = parseFloat(estate.longitude);

                var marker = new google.maps.Marker({
                    position: { lat: latitude, lng: longitude },
                    map: map,
                    icon: src = "img/maps-and-flags32.png",
                });
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <script src="js/zapyt.js"></script>

</body>

</html>