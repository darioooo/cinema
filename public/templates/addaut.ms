<div class="form-group row "><label for="autore" class="col-sm-2 col-form-label">autore nome</label>       <div class="col-sm-7">    <input type="text" class="form-control col-sm-3 " name="nome'+i+'" id="nome'+i+'" value="">    </div>    <div class="col-sm-3">  <select class=" form-control col-sm-2 col-form" id="select'+i+'" >   <option   id="option" nome="" cognome="" naz="" >nuovo autore  </option>  {{#autori}}   <option id="option" nome="{{nome}}" cognome="{{cognome}}" naz="{{naz}}" >{{nome}}{{cognome}}  </option> {{/autori}}  </select>  </div>  </div>  <div class="form-group row">    <label for="cognome" class="col-sm-2 col-form-label">cognome autore</label>       <div class="col-sm-10">    <input type="text" class="form-control" name="cognome'+i+'" id="cognome'+i+'" value="">  </div></div>  <div class="form-group row">    <label for="nazinalità" class="col-sm-2 col-form-label">Nazionalità</label>       <div class="col-sm-10">    <input type="text" class="form-control" name="naz'+i+'" id="naz'+i+'" value="">  </div></div>