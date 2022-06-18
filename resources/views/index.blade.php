@extends('layouts.defult')
@section('content')
<section>
    <div>
        <form action="{{ url('/todo')}}" method="POST">
            @csrf
            <div style="width: 100%;
  display: inline-flex;
  justify-content: center;">
                <input style="width:80%;" type="text" name="title" id="title">
                 <input style="  width: 80px;
  border-radius: 0;
  background-color: blue;
  border: none;
  padding: 2px;
  color: white;" type="submit" value="create">    
            </div>
            @error('title')
            <p style="color:red; text-align:center;"> Please enter a value</p>
            @enderror
        </form>
    </div>
</section>
<section>
    @foreach($todos as $todo)
    <div style="width: 100%;
  display: inline-flex;
  justify-content: center;">
        <div style="  display: inline-flex; margin-top:20px; height:40px; border-radius:5px; width:80%;
  background:white; padding:5px;">{{$todo->title}}
   

<form action={{ route('todo.destroy',$todo) }} method="POST"  > 
        @csrf 
        @method('DELETE')
        
        <button type="submit" style=" color:red;">Delete</button>
    </form> 
    
</div>
   
    </div>
   @endforeach
</section>
@endsection 