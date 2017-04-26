package hu.qwaevisz.tickethandling.ejbservice.converter;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.security.PermitAll;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.DOMException;
import org.xml.sax.SAXException;

import hu.qwaevisz.tickethandling.ejbservice.domain.EmployeeStub;
import hu.qwaevisz.tickethandling.ejbservice.domain.PriorityStub;
import hu.qwaevisz.tickethandling.ejbservice.domain.StatusStub;
import hu.qwaevisz.tickethandling.ejbservice.domain.TicketStub;
import hu.qwaevisz.tickethandling.persistence.entity.Message;
import hu.qwaevisz.tickethandling.persistence.entity.Ticket;
import hu.qwaevisz.tickethandling.persistence.service.MessageService;

@PermitAll
@Stateless
public class TicketConverterImpl implements TicketConverter {

	@EJB
	private MessageService msgService;

	@Override
	public TicketStub to(Ticket ticket) throws DOMException, ParserConfigurationException, SAXException, IOException, ParseException {
		final EmployeeConverter empConv = new EmployeeConverterImpl();
		final CustomerConverter custConv = new CustomerConverterImpl();

		final StatusStub status = StatusStub.valueOf(ticket.getStatus().toString());
		final PriorityStub priority = PriorityStub.valueOf(ticket.getPriority().toString());

		EmployeeStub processor = empConv.to(ticket.getProcessor());

		List<Message> conversation = this.msgService.readConversation(ticket.getId());

		return new TicketStub(ticket.getId(), custConv.to(ticket.getSystem()), ticket.getSender_name(), priority, ticket.getBusiness_impact(),
				ticket.getSteps_to_rep(), ticket.getCreationdate(), ticket.getLevel(), processor, status, ticket.getLastchanged(), conversation);
	}

	@Override
	public List<TicketStub> to(List<Ticket> tickets) throws DOMException, ParserConfigurationException, SAXException, IOException, ParseException {
		final List<TicketStub> result = new ArrayList<TicketStub>();
		for (final Ticket ticket : tickets) {
			result.add(this.to(ticket));
		}
		return result;
	}

}
