<#-- Copyright 2020 Google LLC. All rights reserved.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<#include "header.ftl">
<main role="main">
   <div class="py-5">
      <div class="container bg-light py-3 px-lg-5 py-lg-5">
         <#if cart?size==0>
         <h3>Seu carrinho está vazio!</h3>
         <p>Os itens que você adicionar ao seu carrinho de compras aparecerão aqui.</p>
         <a class="btn btn-primary" href="/" role="button">Procurar Produtos &rarr; </a>
         <#else>
         <div class="row mb-3 py-2">
            <div class="col">
               <h3>${cart?size} item no seu carrinho de compras</h3>
            </div>
            <div class="col text-right">
               <form method="POST" action="/cart/empty">
                  <button class="btn btn-secondary" type="submit">Esvaziar carrinho</button>
                  <a class="btn btn-info" href="/" role="button">Procurar mais produtos &rarr; </a>
               </form>
            </div>
         </div>
         <hr>
         <#list cart as item>
         <div class="row pt-2 mb-2">
            <div class="col text-right">
               <a href="/product/${item.id}"><img class="img-fluid" style="width: auto; max-height: 60px;"
                  src="${item.picture}" /></a>
            </div>
            <div class="col align-middle">
               <strong>${item.name}</strong><br/>
               <small class="text-muted">SKU: #${item.id}</small>
            </div>
            <div class="col text-left">
               <strong>
               ${item.priceUsd}
               </strong>
            </div>
         </div>
         </#list>
         <hr/>
         <div class="row py-3 my-2">
            <div class="col-12 col-lg-8 offset-lg-2">
               <h3>Conferir</h3>
               <form action="/cart/checkout" method="POST">
                  <div class="form-row">
                     <div class="col-md-5 mb-3">
                        <label for="email">Endereço E-mail</label>
                        <input type="email" class="form-control" id="email"
                           name="email" value="endereco@dominio.com" required>
                     </div>
                     <div class="col-md-5 mb-3">
                        <label for="street_address">Rua</label>
                        <input type="text" class="form-control"  name="street_address"
                           id="street_address" value="1600 Amphitheatre Parkway" required>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="zip_code">CEP</label>
                        <input type="text" class="form-control"
                           name="zip_code" id="zip_code" value="94043" required pattern="\d{4,5}">
                     </div>
                  </div>
                  <div class="form-row">
                     <div class="col-md-5 mb-3">
                        <label for="city">Cidade</label>
                        <input type="text" class="form-control" name="city" id="city"
                           value="São Miguel do Oeste" required>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="state">Estado</label>
                        <input type="text" class="form-control" name="state" id="state"
                           value="SC" required>
                     </div>
                     <div class="col-md-5 mb-3">
                        <label for="country">País</label>
                        <input type="text" class="form-control" id="country"
                           placeholder="Country Name"
                           name="country" value="Brasil" required>
                     </div>
                  </div>
                  <div class="form-row">
                     <div class="col-md-6 mb-3">
                        <label for="credit_card_number">Cartão de Crédito</label>
                        <input type="text" class="form-control" id="credit_card_number"
                           name="credit_card_number"
                           placeholder="0000-0000-0000-0000"
                           value="4432-8015-6152-0454"
                           required pattern="\d{4}-\d{4}-\d{4}-\d{4}">
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="credit_card_expiration_month">Mês</label>
                        <select name="credit_card_expiration_month" id="credit_card_expiration_month"
                           class="form-control">
                           <option value="1">Janeiro</option>
                           <option value="2">Fevereiro</option>
                           <option value="3">Março</option>
                           <option value="4">Abril</option>
                           <option value="5">Maio</option>
                           <option value="6">Junho</option>
                           <option value="7">Julho</option>
                           <option value="8">Agosto</option>
                           <option value="9">Setembro</option>
                           <option value="10">Outubro</option>
                           <option value="11">Novembro</option>
                           <option value="12">Dezembro</option>
                        </select>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="credit_card_expiration_year">Ano</label>
                        <select name="credit_card_expiration_year" id="credit_card_expiration_year"
                           class="form-control">
                           <option value="1">2018</option>
                           <option value="2">2019</option>
                           <option value="3">2020</option>
                           <option value="4">2021</option>
                           <option value="5">2022</option>
                           <option value="6">2023</option>
                           <option value="7">2024</option>
                           <option value="8">2025</option>
                           <option value="9">2026</option>
                           <option value="10">2027</option>
                           <option value="11">2028</option>
                           <option value="12">2029</option>
                        </select>
                     </div>
                     <div class="col-md-2 mb-3">
                        <label for="credit_card_cvv">CVV</label>
                        <input type="password" class="form-control" id="credit_card_cvv"
                           autocomplete="off"
                           name="credit_card_cvv" value="672" required pattern="\d{3}">
                     </div>
                  </div>
                  <div class="form-row">
                     <button class="btn btn-primary" type="submit">Fazer o pedido &rarr;</button>
                  </div>
               </form>
            </div>
         </div>
         </#if>
         <#if recommend??>
         <#include "recommendations.ftl">
         </#if>
      </div>
   </div>
</main>
<#include "footer.ftl">

