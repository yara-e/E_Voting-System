<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Todo</title>
    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
</head>
<body style="background:lightgray;">
    <header>
       <div  >
        <h1 style="text-align:center; margin-top:30px; font:20px Arial sans-serif;">Todos</h1>
</div>
    </header>
     @yield('content')
</body>
</html>