<script type="text/javascript">
var i =0;
$(document).ready(function() {

$('select').click(function() {
   var nome=$('option:selected',this).attr("nome");
    var cognome=$(' option:selected',this).attr("cognome");
    var naz=$(' option:selected',this).attr("naz");
    console.log(nome);
    $('#nome').val(nome);
    $('#cognome').val(cognome);
    $('#naz').val(naz);
       
  });

});

$(document).ready(function()
{
    $("#form").validate(
    {
        rules:
        {
            isbn: "required",
            titolo: "required",
            casa_edi: "required",
            
            nome: "required",
            cognome: "required",
            naz: "required",
        },
        messages:
        {
           isbn: "inserisci un isbn",

            titolo: "inserisci un titolo",
            casa_edi: "inserire la casa edietrice!",
            
            nome: "inserire nome dell'autore",
            cognome: "inserire cognome dell'autore",
            naz: "inserire Nazionalità",
        }
  

    });
});

$(document).ready(function(){
  
  $('#addaut').click(function() {
     i++;
    var html='{{>addaut.ms}}';
  $('#ciao').append(html)
  console.log(i);
  $('#n_aut').val(i);

  $('#select'+i).click(function() {
   var nome=$('option:selected',this).attr("nome");
    var cognome=$(' option:selected',this).attr("cognome");
    var naz=$(' option:selected',this).attr("naz");
    console.log(nome);
    $('#nome'+i).val(nome);
    $('#cognome'+i).val(cognome);
    $('#naz'+i).val(naz);
       
  });
  });
});



</script>
<style type="text/css">
  form{

    background-color: black;
    opacity: 0.9;

  
  }
  label, input, textarea,select { 
    color: #dedede; 
    float: left; 
    font-family: Verdana, sans-serif; 
    margin: 10px 0; 

}
button{
  width: 100%;

}
  
</style>
<div class='container-fluid'>
<form method="post" href='/add' class='form-group' id="form">
  <div class="form-group row">
    <label for="titolo" class="col-sm-2 col-form-label">titolo</label>
      <div class="col-sm-10">
    <input type="text" class="form-control" name="titolo" >
  </div>
</div>

  <div class="form-group row">
    <label for="isbn" class="col-sm-2 col-form-label">isbn</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="isbn">
  </div>
</div>

  <div class="form-group row">
    <label for="casa_edi" class="col-sm-2 col-form-label">Casa Editrice</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="casa_edi">
      </div>
        </div>

  <div class="form-group row">
    <label for="riassunto" class="col-sm-2 col-form-label">riassunto</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="abstract">
  </div>
</div>

<div class="form-group row ">
    <label for="autore" class="col-sm-2 col-form-label">autore nome</label>
       <div class="col-sm-7">
    <input type="text" class="form-control col-sm-3 " name='nome0' id='nome' value="">
    </div>
    <div class="col-sm-3">
  <select class=" form-control col-sm-2 col-form" id='select' >
   <option   id='option' nome='' cognome='' naz='' >nuovo autore  </option>
  {{#autori}}
   <option id='option' nome='{{nome}}' cognome='{{cognome}}' naz='{{naz}}' >{{nome}} {{cognome}}  </option>
 {{/autori}}
  </select>
  </div>
  </div>

  <div class="form-group row">
    <label for="cognome" class="col-sm-2 col-form-label">cognome autore</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="cognome0" id="cognome" value="">
  </div>
  </div>

  <div class="form-group row">
    <label for="nazinalità" class="col-sm-2 col-form-label">Nazionalità</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="naz0" id="naz" value="">
  </div>
</div>
<div id='ciao'> 
</div>
   <button type='button' class='btn btn-primary' id='addaut'> aggiungi un nuovo autore</button>
   <br>
   <br>
   <input type='hidden' name='n_aut' id='n_aut' value=''></input>
    <button type="submit" class="btn btn-primary" id='submit'>Submit</button>
</form>

</div>