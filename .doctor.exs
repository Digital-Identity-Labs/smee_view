%Doctor.Config{
  ignore_modules: [
    Jason.Encoder, SmeeView.Protocols.Aspect, SmeeView.Utils, SmeeView.Aspects.Null
  ],
  ignore_paths: [],
  min_module_doc_coverage: 40,
  min_module_spec_coverage: 0,
  min_overall_doc_coverage: 50,
  min_overall_spec_coverage: 0,
  moduledoc_required: true,
  raise: false,
  reporter: Doctor.Reporters.Full,
  struct_type_spec_required: true,
  umbrella: false
}
