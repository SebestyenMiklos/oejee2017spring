package hu.qwaevisz.tickethandling.webservice;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import hu.qwaevisz.tickethandling.ejbservice.domain.TicketStub;
import hu.qwaevisz.tickethandling.ejbservice.exception.AdaptorException;
import hu.qwaevisz.tickethandling.ejbservice.exception.FacadeException;

@Path("/ticket")
public interface TicketRestService {

	@GET
	@Path("/all")
	@Produces("application/json")
	List<TicketStub> getTickets() throws AdaptorException, FacadeException;

	@POST
	@Path("/processor")
	@Consumes("application/json")
	@Produces("application/json")
	List<TicketStub> getTicket(String processor) throws AdaptorException, FacadeException;

	@POST
	@Path("/create")
	@Consumes("application/json")
	@Produces("application/json")
	TicketStub createTicket(TicketStub newTicket) throws AdaptorException, FacadeException;
}
