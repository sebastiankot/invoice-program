package kots.invoiceprogram.model.dto;

import kots.invoiceprogram.model.selectors.PaymentMethod;
import lombok.Builder;
import lombok.Getter;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Getter
@Builder
public class InvoiceDto {

    private Long id;
    private BusinessDto business;
    private CustomerDto customer;
    private List<InvoicePaymentDto> paymentsList;
    private Set<ItemDto> itemList;
    private Set<InvoiceGtuDto> gtuType;
    private PaymentMethod paymentMethod;
    private String invoiceNumber;
    private LocalDate createdDate;
    private LocalDate issueDate;
    private LocalDate dueDate;
    private BigDecimal netPrice;
    private BigDecimal taxValue;
    private BigDecimal grossPrice;
    private BigDecimal includePayment;
    private String currencyName;
    private String otherCurrencyName;
    private BigDecimal otherCurrencyGrossPrice;
    private BigDecimal exchangeRate;
}
