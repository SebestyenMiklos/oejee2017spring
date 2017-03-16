CREATE TABLE component (
	comp_id CHARACTER VARYING(10) NOT NULL,
	comp_description CHARACTER VARYING(150) NOT NULL,
	comp_creationdate TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	CONSTRAINT PK_COMPONENT_ID PRIMARY KEY (comp_id)
);

CREATE TABLE customer (
	cust_sys_id CHARACTER VARYING(10) NOT NULL,
	cust_name CHARACTER VARYING(100) NOT NULL,
	cust_address CHARACTER VARYING(100) NOT NULL,
	cust_cont_name CHARACTER VARYING(60) NOT NULL,
	cust_cont_phone CHARACTER VARYING(30) NOT NULL,
	cust_cont_mail CHARACTER VARYING(50) NOT NULL,
	CONSTRAINT PK_CUST_SYS_ID PRIMARY KEY (cust_sys_id)
);

CREATE TABLE comp_in_system (
	cis_sys_id CHARACTER VARYING(10) NOT NULL,
	cis_comp_id CHARACTER VARYING(10) NOT NULL,
	cis_description CHARACTER VARYING(150) NOT NULL,
	cis_creationdate TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	CONSTRAINT FK_CIS_COMP FOREIGN KEY (cis_comp_id)
	  REFERENCES component (comp_id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT,
	 CONSTRAINT FK_CIS_CUST FOREIGN KEY (cis_sys_id)
	  REFERENCES customer (cust_sys_id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE employee (
	emp_id CHARACTER VARYING(5) NOT NULL,
	emp_name CHARACTER VARYING(100) NOT NULL,
	emp_level INTEGER NOT NULL,
	emp_email CHARACTER VARYING(50) NOT NULL,
	emp_phone CHARACTER VARYING(30) NOT NULL,
	CONSTRAINT PK_EMPLOYEE_ID PRIMARY KEY (emp_id)
);

CREATE TABLE priority (
	prio_id INTEGER NOT NULL,
	prio_description CHARACTER VARYING(20) NOT NULL,
	CONSTRAINT PK_PRIORITY_ID PRIMARY KEY (prio_id)
);

CREATE TABLE status (
	stat_id INTEGER NOT NULL,
	stat_description CHARACTER VARYING(20) NOT NULL,
	CONSTRAINT PK_STATUS_ID PRIMARY KEY (stat_id)
);

CREATE TABLE ticket (
	tic_id CHARACTER VARYING(20) NOT NULL,
	tic_sys_id CHARACTER VARYING(10) NOT NULL,
	tic_sender_name CHARACTER VARYING(60) NOT NULL,
	tic_priority INTEGER NOT NULL,
	tic_business_imp CHARACTER VARYING(150) NOT NULL,
	tic_steps_to_rep CHARACTER VARYING(250) NOT NULL,
	tic_creationdate TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	tic_level INTEGER NOT NULL,
	tic_processor_id CHARACTER VARYING(5) NOT NULL,
	tic_status INTEGER NOT NULL,
	tic_lastchanged TIMESTAMP WITHOUT TIME ZONE NOT NULL,
	CONSTRAINT PK_TICKET_ID PRIMARY KEY (tic_id),
	CONSTRAINT FK_TICKET_CUST FOREIGN KEY (tic_sys_id)
	  REFERENCES customer (cust_sys_id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_TICKET_EMP FOREIGN KEY (tic_processor_id)
	  REFERENCES employee (emp_id) MATCH SIMPLE ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT FK_TICKET_PRIO FOREIGN KEY (tic_priority)
	  REFERENCES priority (prio_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT FK_TICKET_STAT FOREIGN KEY (tic_status)
	  REFERENCES status (stat_id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT
);

ALTER TABLE component OWNER TO postgres;
ALTER TABLE customer OWNER TO postgres;
ALTER TABLE comp_in_system OWNER TO postgres;
ALTER TABLE employee OWNER TO postgres;
ALTER TABLE priority OWNER TO postgres;
ALTER TABLE status OWNER TO postgres;
ALTER TABLE ticket OWNER TO postgres;
