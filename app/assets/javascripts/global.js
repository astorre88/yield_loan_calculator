jQuery(document).on('turbolinks:load', function() {
  if ($('input[name="sum"]').val().length < 1) {
    $('input[id="calc-button"]').prop('disabled', true);
  }
  $('input[name="sum"]').on('keyup select', function() {
    if ($(this).val !== '') {
      return $('input[id="calc-button"]').prop('disabled', false);
    }
  });
  var count, payments, recount;
  payments = $('#payments');
  count = payments.find('.count > span');
  recount = function() {
    return count.text(payments.find('.nested-fields').size());
  };
  payments.on('cocoon:before-insert', function(e, el_to_add) {
    return el_to_add.fadeIn(200);
  });
  payments.on('cocoon:after-insert', function(e, added_el) {
    added_el.effect('highlight', {}, 100);
    return recount();
  });
  payments.on('cocoon:before-remove', function(e, el_to_remove) {
    $(this).data('remove-timeout', 200);
    return el_to_remove.fadeOut(200);
  });
  return payments.on('cocoon:after-remove', function(e, removed_el) {
    return recount();
  });
});
