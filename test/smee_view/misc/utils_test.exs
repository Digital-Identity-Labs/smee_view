defmodule SmeeViewMiscUtilsTest do
  use ExUnit.Case

  alias Smee.Entity
  alias SmeeView.Utils
  alias ExampleEntities


  describe "normalize/1" do

    test "strings, er, become strings" do
      assert "hello" = Utils.normalize("hello")
    end

    test "atoms become strings" do
      assert "pigeon" = Utils.normalize(:pigeon)
    end

    test "integers become strings" do
      assert "72" = Utils.normalize(72)
    end

  end

  describe "normalize_email/1" do

    test "should remove mailto: scheme prefix from email URLs" do
      assert "pete@mimoto.co.uk" = Utils.normalize_email("mailto:pete@mimoto.co.uk")
    end

    test "should pass through non-URL email addresses unchanged" do
      assert "pete@mimoto.co.uk" = Utils.normalize_email("pete@mimoto.co.uk")
    end

  end

  describe "default_lang/0" do

    test "should return the default lang of 'en' if it has not been set in the application configuration" do
      assert "en" = Utils.default_lang()
    end

  end

  describe "fallback_lang/0" do

    test "should always return 'en'" do
      assert "en" = Utils.fallback_lang()
    end

  end

  describe "default_text/0" do

    test "should always return an empty string if not set in the global config" do
      assert "" = Utils.default_text()
    end

  end

  describe "parse_keywords/1" do

    test "should break up a standard-compliant string into a list of words" do
      assert ["one", "two", "three"] = Utils.parse_keywords("one two three")
    end

    test "should convert + symbols into spaces in keywords" do
      assert ["hello world", "hiya"] = Utils.parse_keywords("hello+world hiya")
    end

    test "should handle non-compliant use of commas" do
      assert ["potato", "onion", "carrot", "parsley"] = Utils.parse_keywords("potato,onion, carrot,,parsley")
    end

  end

  describe "parse_protocols/1" do

    test "should break up a standard-compliant string into a list of protocols" do
      assert ["one", "two", "three"] = Utils.parse_protocols("one two three")
    end

  end

  describe "parse_boolean/1" do

    test "should convert various positive values into a true" do
      assert true == Utils.parse_boolean("true")
      assert true == Utils.parse_boolean("TRUE")
      assert true == Utils.parse_boolean("1")
      assert true == Utils.parse_boolean(1)
    end

    test "should convert various negative values into a false" do
      assert false == Utils.parse_boolean("false")
      assert false == Utils.parse_boolean("FALSE")
      assert false == Utils.parse_boolean("0")
      assert false == Utils.parse_boolean(0)
    end

    test "should convert anything else into a false" do
      assert false == Utils.parse_boolean(nil)
      assert false == Utils.parse_boolean("")
      assert false == Utils.parse_boolean("geese")
    end

  end

  describe "extract_data_from_xml/2" do

    test "should respond to all xmap values being nil by immediately returning a special empty response" do
      assert  [all: []] = Utils.extract_data_from_xml(Entity.xdoc(ExampleEntities.oasis_sp1), [sp: nil, idp: nil])
    end

    test "should respond to a valid SweetXML xmap by applying it to the parsed xdoc" do

      #import SweetXml, except: [sigil_x: 2]
      import Smee.Sigils

      assert  %{idp: [], sp: [%{uri: "urn:oasis:names:tc:SAML:2.0:protocol"}]} = Utils.extract_data_from_xml(
                Entity.xdoc(ExampleEntities.oasis_sp1),
                [
                  sp: [
                    ~x"//md:SPSSODescriptor"l,
                    uri: ~x"string(@protocolSupportEnumeration)"s,
                  ],
                  idp: [
                    ~x"//md:IDPSSODescriptor"l,
                    uri: ~x"string(@protocolSupportEnumeration)"s,
                  ]
                ]
              )
    end

  end

  describe "parse_attr_values/1" do

    test "should return valid binary strings as part of a list" do
      assert ["potato", "onion", "carrot", "parsley"] = Utils.parse_attr_values(["potato", "onion", "carrot", "parsley"])
    end

    test "Empty strings should not be returned in the list" do
      assert [] = Utils.parse_attr_values(["", ""])
      assert [] = Utils.parse_attr_values([""])
      assert [] = Utils.parse_attr_values([])
    end

    test "should handle nil too, returning an empty list" do
      assert [] = Utils.parse_attr_values(nil)
    end

  end

end
