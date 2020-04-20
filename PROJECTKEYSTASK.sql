

1)a) Display a list of all property names and their property id’s for Owner Id: 1426. 
SELECT property.Name, OwnerProperty.PropertyId,OwnerProperty.OwnerId
FROM Property
LEFT JOIN OwnerProperty
ON property.Id = OwnerProperty.Id
where OwnerProperty.OwnerId = 1426;

 1)b) Display the current home value for each property in question a).
 select property.Name, OwnerProperty.OwnerId, OwnerProperty.PropertyId, PropertyHomeValue.value
 from property
 inner join OwnerProperty
 on Property.Id=OwnerProperty.Id
 inner join PropertyHomeValue
 on OwnerProperty.PropertyId=PropertyHomeValue.PropertyId
 where OwnerProperty.OwnerId='1426' and PropertyHomeValue.IsActive='1' 

  1)c)i)For each property in question a), return the following:                                                                      
Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query that returns the sum of all payments from start date to end date. 

 select property.Name, TenantProperty.PaymentAmount 'Rental Payament Amount' ,
 TenantPaymentFrequencies.Name 'Tenant Payment Frequency', TenantProperty.StartDate, 
 TenantProperty.EndDate,  OwnerProperty.OwnerId, OwnerProperty.PropertyId,
 case
 when TenantPaymentFrequencies.Name = 'Weekly' then 
 cast(round(TenantProperty.PaymentAmount*DATEDIFF(WEEK,TenantProperty.StartDate,TenantProperty.EndDate),0) as int)
 when TenantPaymentFrequencies.Name='Fortnightly' then 
 cast(round((TenantProperty.PaymentAmount/2)*DATEDIFF(week,TenantProperty.StartDate,TenantProperty.EndDate),0) as int)
 when TenantPaymentFrequencies.name='Monthly' then
  cast (round(TenantProperty.PaymentAmount*DATEDIFF(MONTH,TenantProperty.StartDate,TenantProperty.EndDate),0)as int )
 else null
 end
 as AnnualPayment
 from property
 inner join OwnerProperty
 on Property.Id=OwnerProperty.Id
  inner join TenantProperty
 on OwnerProperty.PropertyId = TenantProperty.PropertyId
 inner join TenantPaymentFrequencies
 on TenantProperty.PaymentFrequencyId=TenantPaymentFrequencies.Id
 where OwnerProperty.OwnerId='1426'*/

 1)d)Display all the jobs available

select job.Id, job.JobDescription, jobstatus.Status
from Job
inner join JobStatus
on job.Id=JobStatus.Id
where JobStatus.Status='open'


 1) e)Display all property names, current tenants first and last names 
and rental payments per week/ fortnight/month for the properties in question a).

select property.Name, TenantProperty.PaymentAmount 'Rental Payament Amount' ,
 TenantPaymentFrequencies.Name 'Tenant Payment Frequency', OwnerProperty.OwnerId,
  OwnerProperty.PropertyId,isnull(Person.FirstName,'') + ' '+ isnull(Person.LastName,'') as 'Tenant Name',Property.Id
 from property
 inner join OwnerProperty
 on Property.Id=OwnerProperty.Id
  inner join TenantProperty
 on OwnerProperty.PropertyId = TenantProperty.PropertyId
 inner join TenantPaymentFrequencies
 on TenantProperty.PaymentFrequencyId=TenantPaymentFrequencies.Id
 inner join  Person
 on property.id=person.id
 inner join Tenant
 on person.id=tenant.Id
 
 where OwnerProperty.OwnerId='1426' and tenant.IsActive=1

 2)
 select
property.AddressId, property.Name,
isnull(Person.FirstName,' ')+' '+isnull(Person.LastName,' ') as 'Current Owner', 
isnull(Address.Number,' ')+' '+isnull(Address.Street,' ')+' '+isnull(Address.Suburb,' ')+' '+isnull(Address.City,' ')+ ' '+
isnull(Address.Region,' ')+' '+isnull(Address.PostCode,' ') as Address,
concat(property.Bedroom,' bedroom')+' ' + concat(Property.Bathroom,' Bathroom') as 'Property Details',
isnull(PropertyExpense.Description,' ') as Expense ,isnull(cast(PropertyExpense.Amount as int),0) as Amount,
convert(nvarchar,PropertyExpense.Date,106) as Date,
case
when TenantProperty.PaymentFrequencyId='1' then concat(cast(TenantProperty.PaymentAmount as int),' per week')
when TenantProperty.PaymentFrequencyId='2' then CONCAT(cast(tenantproperty.paymentamount as int),' per fortnight')
when TenantProperty.PaymentFrequencyId='3' then concat(cast(TenantProperty.PaymentAmount as int),' per month')
else 
null
end
as 'Rental Payment'
 from Address
left join Property
on address.AddressId=property.AddressId
left join OwnerProperty
on Property.Id=OwnerProperty.OwnerId
left join Person
on property.Id=Person.Id
left join TenantProperty
on person.Id = TenantProperty.Id
left join PropertyExpense
on TenantProperty.PropertyId=PropertyExpense.PropertyId
where property.AddressId='570'








