defmodule SmeeViewAspectsKeyTest do
  use ExUnit.Case


  alias SmeeView.Aspects.Key, as: ThisAspect

  describe "new/3" do

    test "parses all data fields as returned by SweetXML's xpath" do
      assert %ThisAspect{
               type: :public,
               pem: "-----BEGIN CERTIFICATE-----\nMIIDEzCCAfugAwIBAgIUT6jU1lE/HRPejPdsm8epM0vUa7EwDQYJKoZIhvcNAQEF\nBQAwFTETMBEGA1UEAxMKaW5kaWlkLm5ldDAeFw0xNDExMTAxMjM3MzVaFw0zNDEx\nMTAxMjM3MzVaMBUxEzARBgNVBAMTCmluZGlpZC5uZXQwggEiMA0GCSqGSIb3DQEB\nAQUAA4IBDwAwggEKAoIBAQCoEvnN/TSYW1WcwzIT0VDek73vOEF+P/ruM3VXsn50\nu1yGJO/I2u7mj4uB6z4/c2GlnG/bk1lPm2udxgQvsfQLefSudhUXE6I1+5z2BeKh\nItywlU7axKJ3yDkttnF91zoLdcWlb1G25bQG1KCeU5MOEJIwEi6AgNemEWcGyUDN\nJhL5mu6deaMchpHpZcg/ANi8xoqcTAIMhZUQwwLWeocz7Wcp63dO6fXy0lY05udD\nlldxFpPgnZFJC2Ip1PETDch3peze6UJPDypsnSMuq4d05OU8Ys2bXe5nnTxUFUMf\nuUPWDSFLn0kIpYO4n710AUJ/IXYBp7ilWnNRu8MlOLfTAgMBAAGjWzBZMDgGA1Ud\nEQQxMC+CCmluZGlpZC5uZXSGIWh0dHBzOi8vaW5kaWlkLm5ldC9pZHAvc2hpYmJv\nbGV0aDAdBgNVHQ4EFgQUVeUalccl0Ln3ZVxeQvuTCxr5v8swDQYJKoZIhvcNAQEF\nBQADggEBAE4Ge6J/gCDnFxv32olly4khj+O4ubmdWHggfwIhQmlizGzTgVhN/0hD\n/KttRlKIcJRvt/aGg/r3Ykyv4P9x34t5cxztPutjiQefe8QC7Lnxo+OW1Tu+1xKq\npbsZDh1R/gdDjSzpAtEoXZWUFM4hrYAzGuRc/8AelXVRS1kFfyi61ZsfduaimShu\nKWGyy5xzC8UqFyDtOLUnJicnPOfmZWzGEjnWYZWCYseTmdxPAZRDIlB+z+ZXQu41\n+pwjmhLlMoHc/E1WZD8jEIzp0tVhjA9xS85X1UyJxLPnBcWnf0f24DNnPPCywlcz\n7PimycEKJ5Gu+L53LzzM6aMlPyWhm8Y=\n-----END CERTIFICATE-----",
               use: nil,
               role: :idp
             } = ThisAspect.new(
               %{
                 type: :public,
                 pem: """
                                                                                 MIIDEzCCAfugAwIBAgIUT6jU1lE/HRPejPdsm8epM0vUa7EwDQYJKoZIhvcNAQEF
                                                                                  BQAwFTETMBEGA1UEAxMKaW5kaWlkLm5ldDAeFw0xNDExMTAxMjM3MzVaFw0zNDEx
                                                                                  MTAxMjM3MzVaMBUxEzARBgNVBAMTCmluZGlpZC5uZXQwggEiMA0GCSqGSIb3DQEB
                                                                                  AQUAA4IBDwAwggEKAoIBAQCoEvnN/TSYW1WcwzIT0VDek73vOEF+P/ruM3VXsn50
                                                                                  u1yGJO/I2u7mj4uB6z4/c2GlnG/bk1lPm2udxgQvsfQLefSudhUXE6I1+5z2BeKh
                                                                                  ItywlU7axKJ3yDkttnF91zoLdcWlb1G25bQG1KCeU5MOEJIwEi6AgNemEWcGyUDN
                                                                                  JhL5mu6deaMchpHpZcg/ANi8xoqcTAIMhZUQwwLWeocz7Wcp63dO6fXy0lY05udD
                                                                                  lldxFpPgnZFJC2Ip1PETDch3peze6UJPDypsnSMuq4d05OU8Ys2bXe5nnTxUFUMf
                                                                                  uUPWDSFLn0kIpYO4n710AUJ/IXYBp7ilWnNRu8MlOLfTAgMBAAGjWzBZMDgGA1Ud
                                                                                  EQQxMC+CCmluZGlpZC5uZXSGIWh0dHBzOi8vaW5kaWlkLm5ldC9pZHAvc2hpYmJv
                                                                                  bGV0aDAdBgNVHQ4EFgQUVeUalccl0Ln3ZVxeQvuTCxr5v8swDQYJKoZIhvcNAQEF
                                                                                  BQADggEBAE4Ge6J/gCDnFxv32olly4khj+O4ubmdWHggfwIhQmlizGzTgVhN/0hD
                                                                                  /KttRlKIcJRvt/aGg/r3Ykyv4P9x34t5cxztPutjiQefe8QC7Lnxo+OW1Tu+1xKq
                                                                                  pbsZDh1R/gdDjSzpAtEoXZWUFM4hrYAzGuRc/8AelXVRS1kFfyi61ZsfduaimShu
                                                                                  KWGyy5xzC8UqFyDtOLUnJicnPOfmZWzGEjnWYZWCYseTmdxPAZRDIlB+z+ZXQu41
                                                                                  +pwjmhLlMoHc/E1WZD8jEIzp0tVhjA9xS85X1UyJxLPnBcWnf0f24DNnPPCywlcz
                                                                                  7PimycEKJ5Gu+L53LzzM6aMlPyWhm8Y=
                 """,
                 use: nil,
                 role: :idp
               }
             )

    end

  end

end
