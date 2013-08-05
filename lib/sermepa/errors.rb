# encoding: UTF-8

module Sermepa

  ERRORS = {
    :SIS0007 => "Error al desmontar el XML de entrada",
    :SIS0008 => "Error falta Ds_Merchant_MerchantCode",
    :SIS0009 => "Error de formato en Ds_Merchant_MerchantCode",
    :SIS0010 => "Error falta Ds_Merchant_Terminal",
    :SIS0011 => "Error de formato en Ds_Merchant_Terminal",
    :SIS0014 => "Error de formato en Ds_Merchant_Order",
    :SIS0015 => "Error falta Ds_Merchant_Currency",
    :SIS0016 => "Error de formato en Ds_Merchant_Currency",
    :SIS0018 => "Error falta Ds_Merchant_Amount",
    :SIS0019 => "Error de formato en Ds_Merchant_Amount",
    :SIS0020 => "Error falta Ds_Merchant_MerchantSignature",
    :SIS0021 => "Error la Ds_Merchant_MerchantSignature viene vacía",
    :SIS0022 => "Error de formato en Ds_Merchant_TransactionType",
    :SIS0023 => "Error Ds_Merchant_TransactionType desconocido",
    :SIS0026 => "Error No existe el comercio / terminal enviado",
    :SIS0027 => "Error Moneda enviada por el comercio es diferente a la que tiene asignada para ese terminal",
    :SIS0028 => "Error Comercio / terminal está dado de baja",
    :SIS0030 => "Error en un pago con tarjeta ha llegado un tipo de operación no valido",
    :SIS0031 => "Método de pago no definido",
    :SIS0034 => "Error de acceso a la Base de Datos ",
    :SIS0038 => "Error en java",
    :SIS0040 => "Error el comercio / terminal no tiene ningún método de pago asignado",
    :SIS0041 => "Error en el cálculo de la firma de datos del comercio",
    :SIS0042 => "La firma enviada no es correcta",
    :SIS0046 => "El BIN de la tarjeta no está dado de alta",
    :SIS0051 => "Error número de pedido repetido",
    :SIS0054 => "Error no existe operación sobre la que realizar la devolución",
    :SIS0055 => "Error no existe más de un pago con el mismo número de pedido",
    :SIS0056 => "La operación sobre la que se desea devolver no está autorizada",
    :SIS0057 => "El importe a devolver supera el permitido",
    :SIS0058 => "Inconsistencia de datos, en la validación de una confirmación",
    :SIS0059 => "Error no existe operación sobre la que realizar la devolución",
    :SIS0060 => "Ya existe una confirmación asociada a la preautorización",
    :SIS0061 => "La preautorización sobre la que se desea confirmar no está autorizada",
    :SIS0062 => "El importe a confirmar supera el permitido",
    :SIS0063 => "Error. Número de tarjeta no disponible",
    :SIS0064 => "Error. El número de tarjeta no puede tener más de 19 posiciones",
    :SIS0065 => "Error. El número de tarjeta no es numérico",
    :SIS0066 => "Error. Mes de caducidad no disponible",
    :SIS0067 => "Error. El mes de la caducidad no es numérico",
    :SIS0068 => "Error. El mes de la caducidad no es válido",
    :SIS0069 => "Error. Año de caducidad no disponible",
    :SIS0070 => "Error. El Año de la caducidad no es numérico",
    :SIS0071 => "Tarjeta caducada",
    :SIS0072 => "Operación no anulable",
    :SIS0074 => "Error falta Ds_Merchant_Order",
    :SIS0075 => "Error el Ds_Merchant_Order tiene menos de 4 posiciones o más de 12",
    :SIS0076 => "Error el Ds_Merchant_Order no tiene las cuatro primeras posiciones numéricas",
    :SIS0078 => "Método de pago no disponible",
    :SIS0079 => "Error al realizar el pago con tarjeta",
    :SIS0081 => "La sesión es nueva, se han perdido los datos almacenados",
    :SIS0089 => "El valor de Ds_Merchant_ExpiryDate no ocupa 4 posiciones",
    :SIS0092 => "El valor de Ds_Merchant_ExpiryDate es nulo",
    :SIS0093 => "Tarjeta no encontrada en la tabla de rangos",
    :SIS0112 => "Error. El tipo de transacción especificado en Ds_Merchant_Transaction_Type no esta permitido",
    :SIS0115 => "Error no existe operación sobre la que realizar el pago de la cuota",
    :SIS0116 => "La operación sobre la que se desea pagar una cuota no es una operación válida",
    :SIS0117 => "La operación sobre la que se desea pagar una cuota no está autorizada",
    :SIS0118 => "Se ha excedido el importe total de las cuotas",
    :SIS0119 => "Valor del campo Ds_Merchant_DateFrecuency no válido",
    :SIS0120 => "Valor del campo Ds_Merchant_CargeExpiryDate no válido",
    :SIS0121 => "Valor del campo Ds_Merchant_SumTotal no válido",
    :SIS0122 => "Valor del campo Ds_merchant_DateFrecuency o Ds_Merchant_SumTotal tiene formato incorrecto",
    :SIS0123 => "Se ha excedido la fecha tope para realizar transacciones",
    :SIS0124 => "No ha transcurrido la frecuencia mínima en un pago recurrente sucesivo",
    :SIS0132 => "La fecha de Confirmación de Autorización no puede superar en más de 7 días a la de Preautorización",
    :SIS0139 => "Error el pago recurrente inicial está duplicado SIS0142 Tiempo excedido para el pago",
    :SIS0216 => "Error Ds_Merchant_CVV2 tiene mas de 3/4 posiciones",
    :SIS0217 => "Error de formato en Ds_Merchant_CVV2",
    :SIS0221 => "Error el CVV2 es obligatorio",
    :SIS0222 => "Ya existe una anulación asociada a la preautorización",
    :SIS0223 => "La preautorización que se desea anular no está autorizada",
    :SIS0225 => "Error no existe operación sobre la que realizar la anulación",
    :SIS0226 => "Inconsistencia de datos, en la validación de una anulación",
    :SIS0227 => "Valor del campo Ds_Merchan_TransactionDate no válido",
    :SIS0252 => "El comercio no permite el envío de tarjeta",
    :SIS0253 => "La tarjeta no cumple el check-digit",
    :SIS0261 => "Operación detenida por superar el control de restricciones en la entrada al SIS SIS0274 Tipo de operación desconocida o no permitida por esta entrada al SIS"
  }
  
  RESPONSE_CODES = {
    :'0101' => "Tarjeta Caducada",
    :'0102' => "Tarjeta en excepción transitoria o bajo sospecha de fraude",
    :'0116' => "Disponible Insuficiente",
    :'0118' => "Tarjeta no Registrada",
    :'0180' => "Tarjeta ajena al servicio",
    :'0184' => "Error en la autenticación del titular",
    :'0190' => "Denegación sin especificar motivo",
    :'0191' => "Fecha de caducidad errónea",
    :'0202' => "Tarjeta en excepción transitoria o bajo sospecha de fraude con retirada de tarjeta",
    :'0912' => "Emisor no Disponible",
    :'9912' => "Emisor no Disponible",
    :'0904'  => "Comercio no registrado en FUC",
    :'9064' => "Número de posiciones de la tarjeta incorrecto",
    :'9078' => "No existe método de pago válido para esa tarjeta",
    :'9093' => "Tarjeta no existente",
    :'9218' => "El comercio no permite op. seguras por entrada /operaciones",
    :'9253' => "Tarjeta no cumple el check-digit",
    :'9256' => "El comercio no puede realizar preautorizaciones",
    :'9257' => "Esta tarjeta no permite operativa de preautorizaciones",
    :'9261' => "Operación detenida por superar el control de restricciones en la entrada al SIS",
    :'9913' => "Error en la confirmación que el comercio envía al TPV Virtual (solo aplicable en la opción de sincronización SOAP)",
    :'9914' => "Confirmación “KO” del comercio (solo aplicable en la opción de sincronización SOAP)",
    :'9928' => "Anulación de autorización en diferido realizada por el SIS (proceso batch)",
    :'9929' => "Anulación de autorización en diferido realizada por el comercio",
  }
  
  class SermepaRemoteError < StandardError
    def initialize(error_code)
      @error_code = error_code
    end
    
    def message
      ERRORS[self.error_code]
    end
    
    def error_code
      @error_code
    end
    
    def to_s 
      "#{ @error_code }: #{ message }"
    end
  end
  
  class SermepaPaymentError < StandardError
    def initialize(error_code)
      @error_code = error_code
    end
    
    def message
      RESPONSE_CODES[self.error_code]
    end
    
    def error_code
      @error_code
    end
    
    def to_s 
      "#{ @error_code }: #{ message }"
    end
  end
  
  class SermepaInvalidSignature < StandardError

    def message 
      "Invalid signature. Signature does not match with expected signature"
    end
  end
  
end