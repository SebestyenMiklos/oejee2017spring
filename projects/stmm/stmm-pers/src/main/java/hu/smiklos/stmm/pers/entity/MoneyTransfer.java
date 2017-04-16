package hu.smiklos.stmm.pers.entity;

import hu.smiklos.stmm.pers.entity.trunk.MoneyTransferStates;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by SebestyenMiklos on 2017. 04. 15..
 */
@Entity
@Table(name = "money_transfer")
public class MoneyTransfer {

    private String moneytransfer_id;
    private Wallet wallet_from;
    private Wallet wallet_to;
    private Date transferdate;
    private Date returndate;
    private int transfer_amount;
    private int expected_return_amount;
    private int moneytransfer_investment_time_period_month;
    private RepaymentType money_transfer_repayment_type;
    private MoneyTransferStates transfer_state;

    @Id
    @Column(name = "moneytransfer_id")
    public String getMoneytransfer_id() {
        return moneytransfer_id;
    }

    public void setMoneytransfer_id(String moneytransfer_id) {
        this.moneytransfer_id = moneytransfer_id;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "wallet_from")
    public Wallet getWallet_from() {
        return wallet_from;
    }

    public void setWallet_from(Wallet wallet_from) {
        this.wallet_from = wallet_from;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "wallet_to")
    public Wallet getWallet_to() {
        return wallet_to;
    }


    public void setWallet_to(Wallet wallet_to) {
        this.wallet_to = wallet_to;
    }

    @Column(name = "transferdate")
    public Date getTransferdate() {
        return transferdate;
    }

    public void setTransferdate(Date transferdate) {
        this.transferdate = transferdate;
    }

    @Column(name = "returndate")
    public Date getReturndate() {
        return returndate;
    }

    public void setReturndate(Date returndate) {
        this.returndate = returndate;
    }

    @Column(name = "money_transfer_amount")
    public int getTransfer_amount() {
        return transfer_amount;
    }

    public void setTransfer_amount(int transfer_amount) {
        this.transfer_amount = transfer_amount;
    }

    @Column(name = "money_transfer_return_amount")
    public int getExpected_return_amount() {
        return expected_return_amount;
    }

    public void setExpected_return_amount(int expected_return_amount) {
        this.expected_return_amount = expected_return_amount;
    }


    @OneToOne
    @JoinColumn(name = "money_transfer_repayment_type", nullable = false)
    public RepaymentType getMoney_transfer_repayment_type() {
        return money_transfer_repayment_type;
    }

    public void setMoney_transfer_repayment_type(RepaymentType money_transfer_repayment_type) {
        this.money_transfer_repayment_type = money_transfer_repayment_type;
    }

    @Column(name = "money_transfer_invest_period_month", nullable = false)
    public int getMoneytransfer_investment_time_period_month() {
        return moneytransfer_investment_time_period_month;
    }

    public void setMoneytransfer_investment_time_period_month(int moneytransfer_investment_time_period_month) {
        this.moneytransfer_investment_time_period_month = moneytransfer_investment_time_period_month;
    }

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "money_transfer_state", nullable = false)
    public MoneyTransferStates getTransferState() {
        return transfer_state;
    }

    public void setTransferState(MoneyTransferStates transfer_state) {
        this.transfer_state = transfer_state;
    }
}
