<?php  
$data['result'] = 'error'; 

if ($_SERVER['REQUEST_METHOD'] == 'POST') { 
    $data['result'] = 'success';

    $estate_type_ID = isset($_POST['estate_type']) ? intval($_POST['estate_type']) : null;
    $repair_ID = isset($_POST['repair_type']) ? intval($_POST['repair_type']) : null;
    $address = isset($_POST['address']) ? stripslashes(strip_tags($_POST['address'])) : null;
    $floor = isset($_POST['floor']) ? intval($_POST['floor']) : null;
    $number_of_rooms = isset($_POST['number_of_rooms']) ? intval($_POST['number_of_rooms']) : null;
    $space = isset($_POST['space']) ? floatval($_POST['space']) : null;
    $year_of_construction = isset($_POST['year_of_construction']) ? intval($_POST['year_of_construction']) : null;
    $description = isset($_POST['description']) ? stripslashes(strip_tags($_POST['description'])) : null;
    $cost = isset($_POST['cost']) ? floatval($_POST['cost']) : null;
    $latitude = $_POST['latitude'];
    $longitude = $_POST['longitude'];

    if (!$estate_type_ID || !$repair_ID || !$address || !$floor || !$number_of_rooms || !$space || !$year_of_construction || !$description || !$cost) {
        $data['result'] = 'error';
        $data['message'] = 'Заповніть всі поля.';
    } else {
        include("con_bd.php");   
        $query = "INSERT INTO estate (owner_ID, estate_type_ID, area_ID, address, floor, number_of_rooms, space, year_of_construction, repair_ID, description, cost, latitude, longitude, estate_status_ID) 
                  VALUES (1, $estate_type_ID, 1, '$address', $floor, $number_of_rooms, $space, $year_of_construction, $repair_ID, '$description', $cost, '$latitude', '$longitude', 1)";
        $resultsql = mysqli_query($link, $query);
        mysqli_close($link);
    }
}

echo json_encode($data);
?>
