# frozen_string_literal: true

SimpleForm.setup do |config|
  # ---------------------------------------------------------------
  # Classes reutilizáveis (equivalentes Tailwind v4 das do Bootstrap)
  # ---------------------------------------------------------------
  wrap_cls      = 'mb-4'                                              # mb-3
  label_cls     = 'mb-2 inline-block text-sm font-medium'             # form-label
  control_base  = 'block w-full min-w-0 rounded-sm border border-gray-300 bg-white text-sm text-black ' \
                  'focus:border-primary focus:outline-none focus:ring-2 focus:ring-primary/25 ' \
                  'disabled:bg-input-disabled'
  control_cls   = "#{control_base} px-3 py-1.5"                       # form-control / form-select
  file_cls      = "#{control_cls} file:mr-3 file:rounded-sm file:border-0 file:bg-body-secondary file:px-3 file:py-1 file:text-sm"
  range_cls     = 'w-full accent-primary'                             # form-range
  check_cls     = 'size-4 shrink-0 accent-primary'                    # form-check-input
  switch_cls    = 'peer relative h-5 w-9 shrink-0 cursor-pointer appearance-none rounded-full bg-gray-300 ' \
                  'transition-colors checked:bg-primary ' \
                  'after:absolute after:left-0.5 after:top-0.5 after:size-4 after:rounded-full after:bg-white ' \
                  'after:transition-transform checked:after:translate-x-4'
  invalid_cls   = 'border-red-500! focus:ring-red-500/25!'            # is-invalid
  valid_cls     = 'border-green-600! focus:ring-green-600/25!'        # is-valid
  check_invalid = 'outline-2 outline-red-500'
  feedback_cls  = 'mt-1 text-sm text-red-600'                         # invalid-feedback
  hint_cls      = 'mt-1 block text-sm text-secondary'                 # form-text
  check_wrap    = 'flex items-center gap-2'                           # form-check
  check_inline  = 'inline-flex items-center gap-2 mr-4'               # form-check form-check-inline
  check_label   = 'text-sm'                                           # form-check-label
  legend_cls    = 'mb-2 text-sm font-medium'                          # col-form-label pt-0
  row_cls       = 'mb-4 grid grid-cols-1 gap-1 sm:grid-cols-12 sm:gap-4' # row mb-3
  hlabel_cls    = 'py-1.5 text-sm font-medium sm:col-span-3'          # col-sm-3 col-form-label
  hgrid_cls     = 'sm:col-span-9'                                     # col-sm-9
  multi_row     = 'flex flex-row items-center justify-between'

  # Default class for buttons (a variante de cor você aplica na view, ver nota abaixo)
  config.button_class = 'cursor-pointer rounded-sm bg-primary px-4 py-2 text-sm font-medium text-white hover:opacity-90 disabled:opacity-50'

  config.boolean_label_class = check_label
  config.label_text = lambda { |label, required, explicit_label| "#{label} #{required}" }
  config.boolean_style = :inline
  config.item_wrapper_tag = :div
  config.include_default_input_wrapper_class = false
  config.error_notification_class = 'mb-4 rounded-sm border border-red-300 bg-red-100 p-3 text-red-800'
  config.error_method = :to_sentence

  # add validation classes to `input_field`
  config.input_field_error_class = invalid_cls
  config.input_field_valid_class = valid_cls

  # ---------------------------------------------------------------
  # Vertical forms
  # ---------------------------------------------------------------
  config.wrappers :vertical_form, class: wrap_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: label_cls
    b.use :input, class: control_cls, error_class: invalid_cls, valid_class: valid_cls
    b.use :full_error, wrap_with: { class: feedback_cls }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :vertical_boolean, tag: 'fieldset', class: wrap_cls do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, class: check_wrap do |bb|
      bb.use :input, class: check_cls, error_class: check_invalid
      bb.use :label, class: check_label
      bb.use :full_error, wrap_with: { class: feedback_cls }
      bb.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :vertical_collection, item_wrapper_class: check_wrap, item_label_class: check_label,
                                        tag: 'fieldset', class: wrap_cls do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: legend_cls do |ba|
      ba.use :label_text
    end
    b.use :input, class: check_cls, error_class: check_invalid
    b.use :full_error, wrap_with: { class: "#{feedback_cls} block" }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :vertical_collection_inline, item_wrapper_class: check_inline, item_label_class: check_label,
                                               tag: 'fieldset', class: wrap_cls do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: legend_cls do |ba|
      ba.use :label_text
    end
    b.use :input, class: check_cls, error_class: check_invalid
    b.use :full_error, wrap_with: { class: "#{feedback_cls} block" }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :vertical_file, class: wrap_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: label_cls
    b.use :input, class: file_cls, error_class: invalid_cls, valid_class: valid_cls
    b.use :full_error, wrap_with: { class: feedback_cls }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :vertical_select, class: wrap_cls do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: label_cls
    b.use :input, class: control_cls, error_class: invalid_cls, valid_class: valid_cls
    b.use :full_error, wrap_with: { class: feedback_cls }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :vertical_multi_select, class: wrap_cls do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: label_cls
    b.wrapper class: multi_row do |ba|
      ba.use :input, class: "#{control_cls} mx-1", error_class: invalid_cls, valid_class: valid_cls
    end
    b.use :full_error, wrap_with: { class: "#{feedback_cls} block" }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :vertical_range, class: wrap_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label, class: label_cls
    b.use :input, class: range_cls, error_class: invalid_cls, valid_class: valid_cls
    b.use :full_error, wrap_with: { class: feedback_cls }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  # ---------------------------------------------------------------
  # Horizontal forms
  # ---------------------------------------------------------------
  config.wrappers :horizontal_form, class: row_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.use :input, class: control_cls, error_class: invalid_cls, valid_class: valid_cls
      ba.use :full_error, wrap_with: { class: feedback_cls }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :horizontal_boolean, class: row_cls do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :grid_wrapper, class: 'sm:col-span-9 sm:col-start-4' do |wr|     # col-sm-9 offset-sm-3
      wr.wrapper :form_check_wrapper, class: check_wrap do |bb|
        bb.use :input, class: check_cls, error_class: check_invalid
        bb.use :label, class: check_label
        bb.use :full_error, wrap_with: { class: feedback_cls }
        bb.use :hint, wrap_with: { class: hint_cls }
      end
    end
  end

  config.wrappers :horizontal_collection, item_wrapper_class: check_wrap, item_label_class: check_label,
                                          class: row_cls do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.use :input, class: check_cls, error_class: check_invalid
      ba.use :full_error, wrap_with: { class: "#{feedback_cls} block" }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :horizontal_collection_inline, item_wrapper_class: check_inline, item_label_class: check_label,
                                                 class: row_cls do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.use :input, class: check_cls, error_class: check_invalid
      ba.use :full_error, wrap_with: { class: "#{feedback_cls} block" }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :horizontal_file, class: row_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.use :input, class: file_cls, error_class: invalid_cls, valid_class: valid_cls
      ba.use :full_error, wrap_with: { class: feedback_cls }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :horizontal_select, class: row_cls do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.use :input, class: control_cls, error_class: invalid_cls, valid_class: valid_cls
      ba.use :full_error, wrap_with: { class: feedback_cls }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :horizontal_multi_select, class: row_cls do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.wrapper class: multi_row do |bb|
        bb.use :input, class: "#{control_cls} mx-1", error_class: invalid_cls, valid_class: valid_cls
      end
      ba.use :full_error, wrap_with: { class: "#{feedback_cls} block" }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  config.wrappers :horizontal_range, class: row_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :readonly
    b.optional :step
    b.use :label, class: hlabel_cls
    b.wrapper :grid_wrapper, class: hgrid_cls do |ba|
      ba.use :input, class: range_cls, error_class: invalid_cls, valid_class: valid_cls
      ba.use :full_error, wrap_with: { class: feedback_cls }
      ba.use :hint, wrap_with: { class: hint_cls }
    end
  end

  # ---------------------------------------------------------------
  # Inline forms
  # ---------------------------------------------------------------
  config.wrappers :inline_form, class: 'w-full' do |b|                  # col-12
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'                                      # visually-hidden
    b.use :input, class: control_cls, error_class: invalid_cls, valid_class: valid_cls
    b.use :error, wrap_with: { class: feedback_cls }
    b.optional :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :inline_boolean, class: 'w-full' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, class: check_wrap do |bb|
      bb.use :input, class: check_cls, error_class: check_invalid
      bb.use :label, class: check_label
      bb.use :error, wrap_with: { class: feedback_cls }
      bb.optional :hint, wrap_with: { class: hint_cls }
    end
  end

  # ---------------------------------------------------------------
  # Custom switch
  # ---------------------------------------------------------------
  config.wrappers :custom_boolean_switch, class: wrap_cls do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :form_check_wrapper, tag: 'div', class: check_wrap do |bb|
      bb.use :input, class: switch_cls, error_class: check_invalid
      bb.use :label, class: check_label
      bb.use :full_error, wrap_with: { tag: 'div', class: feedback_cls }
      bb.use :hint, wrap_with: { class: hint_cls }
    end
  end

  # ---------------------------------------------------------------
  # Input group (prepend/append são componentes customizados)
  # ---------------------------------------------------------------
  config.wrappers :input_group, class: wrap_cls do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: label_cls
    b.wrapper :input_group_tag, class: 'flex items-stretch' do |ba|    # input-group
      ba.optional :prepend
      ba.use :input, class: "#{control_cls} flex-1", error_class: invalid_cls, valid_class: valid_cls
      ba.optional :append
      ba.use :full_error, wrap_with: { class: feedback_cls }
    end
    b.use :hint, wrap_with: { class: hint_cls }
  end

  # ---------------------------------------------------------------
  # Floating labels (label vem DEPOIS do input e depende do `peer`)
  # ---------------------------------------------------------------
  float_label = 'pointer-events-none absolute left-3 top-1 text-xs text-gray-500 transition-all ' \
                'peer-placeholder-shown:top-3.5 peer-placeholder-shown:text-sm ' \
                'peer-focus:top-1 peer-focus:text-xs'

  config.wrappers :floating_labels_form, class: 'relative mb-4' do |b|  # form-floating mb-3
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :input, class: "#{control_base} peer h-14 px-3 pb-1 pt-5 placeholder:text-transparent",
                  error_class: invalid_cls, valid_class: valid_cls
    b.use :label, class: float_label
    b.use :full_error, wrap_with: { class: feedback_cls }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.wrappers :floating_labels_select, class: 'relative mb-4' do |b|
    b.use :html5
    b.optional :readonly
    b.use :input, class: "#{control_base} h-14 px-3 pb-1 pt-5", error_class: invalid_cls, valid_class: valid_cls
    b.use :label, class: 'pointer-events-none absolute left-3 top-1 text-xs text-gray-500'
    b.use :full_error, wrap_with: { class: feedback_cls }
    b.use :hint, wrap_with: { class: hint_cls }
  end

  config.default_wrapper = :vertical_form

  config.wrapper_mappings = {
    boolean:       :vertical_boolean,
    check_boxes:   :vertical_collection,
    date:          :vertical_multi_select,
    datetime:      :vertical_multi_select,
    file:          :vertical_file,
    radio_buttons: :vertical_collection,
    range:         :vertical_range,
    time:          :vertical_multi_select,
    select:        :vertical_select
  }
end