<script type="text/javascript">
$(document).ready(function() {


  $('select').click(function() {
   var nome=$('#select option:selected').attr("nome");
    var cognome=$('#select option:selected').attr("cognome");
    var naz=$('#select option:selected').attr("naz");
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

//$(document).ready(function()
//{$('#addaut').click(function() {
  //$('#ciao').html('')});
//});


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
<form method="POST" href='/update' class='form-group' id="form">
{{#libri}}
  <div class="form-group row">
    <label for="titolo" class="col-sm-2 col-form-label">titolo</label>
      <div class="col-sm-10">
    <input type="text" class="form-control" name="titolo" value='{{titolo}}' >
  </div>
</div>
<input type='hidden' name='id_lib' value='{{id_lib}}'></input>
  <div class="form-group row">
    <label for="isbn" class="col-sm-2 col-form-label">isbn</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="isbn" value='{{isbn}}' >
  </div>
</div>

  <div class="form-group row">
    <label for="casa_edi" class="col-sm-2 col-form-label">Casa Editrice</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="casa_edi" value='{{casa_edit}}'>
      </div>
        </div>

  <div class="form-group row">
    <label for="riassunto" class="col-sm-2 col-form-label">riassunto</label>
       <div class="col-sm-10">
    <input type="text" class="form-control" name="abstract" value='{{abstract}}'>
  </div>
</div>

{{/libri}}
    <button type="submit" class="btn btn-primary" id='submit'>Submit</button>
</form>

</div>