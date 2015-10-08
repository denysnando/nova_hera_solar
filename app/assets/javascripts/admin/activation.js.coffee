jQuery ->

  # Note: this page should be much easier with AngularJS!

  # Create and fill select with options from JSON
  fillSubcategories = (json) ->
    options = json.subcategories.map (c) ->
      "<option value='#{c.id}'>#{c.name}</option>"
    options = "<option value>Selecione</option>" + options.join("\n")
    $(".account-new .subcategories select").html(options)

  fetchZipCode = (zip_code) ->
    url = "https://lvws0001.lojablindada.com/endereco/?format=json&callback=?&cep=#{zip_code}"
    $(".zip-spinner").spin("small")
    $.getJSON url, (json) ->
      $(".zip-spinner").spin(false)
      $("#address_street").val(json.endereco)
      $("#address_district").val(json.bairro)
      $("#address_city").val(json.cidade)
      $("#address_state").val(json.uf)
      $("#address_number").focus()

  showAccountTypeFields = ->
    selected = $('.account-new .account-type input[type=radio]:checked').val()
    if selected == "business"
      $(".account-new .business-fields").show()
      $(".account-new .personal-fields h2").html("Dados do Responsável")
    else if selected == "personal"
      $(".account-new .business-fields").hide()
      $(".account-new .personal-fields h2").not('.bk').html("Dados Pessoais")
    $(".account-new .personal-fields").show() if selected

  #  Show fields in case of reloading page caused by validation error

  categoryId = $("#account_category_id").val()
  subcategoryId = $("#account_subcategory_id").val()

  if categoryId
    $(".account-new .subcategories").show()
    callback = (json) ->
      fillSubcategories(json)
      $(".account-new .subcategories select").val(subcategoryId)
    $.get "/categories/#{categoryId}", callback, "json"

  $(".account-new .account-type").show() if !!subcategoryId

  showAccountTypeFields()

  # Category changed - fill subcategories and hide other fields

  $("#account_category_id").on "change", ->
    categoryId = $(this).val()
    if categoryId
      callback = (json) ->
        fillSubcategories(json)
        $(".account-new .subcategories").show()
        $(".account-new .account-type
          .account-new .business-fields
          .account-new .personal-fields
          .account-new .bank-account-fields").hide()
      $.get "/categories/#{categoryId}", callback, "json"
    else
      $(".account-new .subcategories,
         .account-new .account-type,
         .account-new .business-fields,
         .account-new .personal-fields,
         .account-new .bank-account-fields").hide()

  # Subcategory changed
  $("#account_subcategory_id").on "change", ->
    $(".account-new .account-type").show()

  # Account type selected
  $(".account-new .account-type input[type=radio]").on "change", ->
    showAccountTypeFields()
    # $(".account-new .personal-fields").show()
      # $("#address_street").attr("disabled", "disabled");

  if(!$("#account_accept_terms").is(':checked'))
    $('#send_account').prop('disabled', true);

  $("#account_accept_terms").on "change", ->
    $(".bank-account-fields").slideDown()
    $('#send_account').attr('disabled', false);

  $('.banks > label').on "click", ->
    if($(this).prev().attr("id") == "bank_account_bank_id_other")
      $("#uncommon_bank_select").slideDown()
    else
      $("#uncommon_bank_select").slideUp()

  $("#address_zip_code").on "blur", ->
    zipCode = fetchZipCode($(this).val())

  $("form.new_account").on "submit", ->
    selected = $('.account-new .account-type input[type=radio]:checked').val()

  $('#reader_order_payment_card_expiry_month').on "keyup", ->
    if $(this).val().length == 2
      $("#reader_order_payment_card_expiry_year").focus()

  $('.icard').on "keyup", ->
    checkCard $(this).val()

  $('.icard').on "focusout", ->
    checkCard $(this).val()

  $('.cards > input').on "click", ->
    cvv = $('#reader_order_payment_card_cvv').val()

    if $(".card_american").prev().is(':checked')
      $('#reader_order_payment_card_cvv').attr 'maxlength', 4
    else
      if(cvv.length > 3)
        cvv = cvv.substring(0, cvv.length - 1)
        $('#reader_order_payment_card_cvv').val(cvv)
        $('#reader_order_payment_card_cvv').attr 'maxlength', 3

  $("#reader_order_payment_card_expiry_month").on "focusout", ->
    dd = $(this).val()
    if(dd > 0 && dd <= 12)
      if(dd.length < 2)
        $(this).val("0" + dd)
      $(this).removeClass('input-error');
      $('input[type=submit]').removeAttr('disabled')
    else
      $(this).addClass('input-error')
      $('input[type=submit]').attr('disabled', true)


  $("#reader_order_payment_card_expiry_year").on "focusout", ->
    informed_year = $(this).val()
    today = new Date();
    year = today.getFullYear().toString().substr(2,2);
    if(informed_year >= parseInt(year) && informed_year <= parseInt(year) + 10)
      $('input[type=submit]').removeAttr('disabled')
      $(this).removeClass('input-error');
    else
      $('input[type=submit]').attr('disabled', true)
      $(this).addClass('input-error')

  $('.cards > input').on "click", ->
    cvv = $('#reader_order_payment_card_cvv').val()

    if $(".card_american").prev().is(':checked')
      $('#reader_order_payment_card_cvv').attr 'maxlength', 4
    else
      if(cvv.length > 3)
        cvv = cvv.substring(0, cvv.length - 1)
        $('#reader_order_payment_card_cvv').val(cvv)
        $('#reader_order_payment_card_cvv').attr 'maxlength', 3

  $("#reader_order_payment_card_expiry_month").on "focusout", ->
    dd = $(this).val()
    if(dd > 0 && dd <= 12)
      if(dd.length < 2)
        $(this).val("0" + dd)
      $(this).removeClass('input-error');
      $('input[type=submit]').removeAttr('disabled')
    else
      $(this).addClass('input-error')
      $('input[type=submit]').attr('disabled', true)


  $("#reader_order_payment_card_expiry_year").on "focusout", ->
    informed_year = $(this).val()
    today = new Date();
    year = today.getFullYear().toString().substr(2,2);
    if(informed_year >= parseInt(year) && informed_year <= parseInt(year) + 10)
      $('input[type=submit]').removeAttr('disabled')
      $(this).removeClass('input-error');
    else
      $('input[type=submit]').attr('disabled', true)
      $(this).addClass('input-error')
