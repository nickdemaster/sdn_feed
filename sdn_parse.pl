#!/usr/bin/perl
use strict;
use warnings;
use XML::LibXML;



my $inputfile = $ARGV[0];

my $data = read_file($inputfile);

print "file sanitation...\n";

$data =~ s/(?<!\\)\'/\\'/g;
$data =~ s/<sdnList xmlns:xsi=\"http:\/\/www.w3.org\/2001\/XMLSchema-instance\" xmlns=\"http:\/\/tempuri.org\/sdnList.xsd\">/<sdnList>/g;
write_file($inputfile, $data);
 
sub read_file {
    my ($inputfile) = @_;
 
    open my $in, '<:encoding(UTF-8)', $inputfile or die "Could not open '$inputfile' for reading $!";
    local $/ = undef;
    my $all = <$in>;
    close $in;
 
    return $all;
}
 
sub write_file {
    my ($inputfile, $content) = @_;
 
    open my $out, '>:encoding(UTF-8)', $inputfile or die "Could not open '$inputfile' for writing $!";;
    print $out $content;
    close $out;
 
    return;
}

print "creating output file...\n";

my $outputfile = 'output.sql';
open(my $fh, '>', $outputfile) or die "Could not open file '$outputfile' $!";
#print $fh "truncate table sdn.vesselInfo; \n" ;


print "parsing xml file...\n";

my $parser = XML::LibXML->new();
my $doc    = $parser->parse_file($inputfile);

foreach my $sdnEntry ($doc->findnodes('/sdnList/sdnEntry')) {

my($uid) = $sdnEntry->findnodes('./uid');	

#logic to decide of uid is defined
if (defined $uid) {
	
	#if defined, opening update statement
    print $fh "INSERT INTO sdnList set uid =",$uid->to_literal , ", ";


	# search in firstName node
	my($firstName) = $sdnEntry->findnodes('./firstName');
  		
  	#logic to decide if node name is defined
  	if (defined $firstName) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh "firstName='",$firstName->to_literal, "', " ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
	# search in lastName node
	my($lastName) = $sdnEntry->findnodes('./lastName');
  		
  	#logic to decide if node name is defined
  	if (defined $lastName) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh "lastName='",$lastName->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
	# search in title node
	my($title) = $sdnEntry->findnodes('./title');
  		
  	#logic to decide if node name is defined
  	if (defined $title) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", title='",$title->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
   	# search in remarks node
	my($remarks) = $sdnEntry->findnodes('./remarks');
  		
  	#logic to decide if node name is defined
  	if (defined $remarks) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", remarks='",$remarks->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; } 	
  		
	# search in sdnType node
	my($sdnType) = $sdnEntry->findnodes('./sdnType');
  		
  	#logic to decide if node name is defined
  	if (defined $sdnType) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", sdnType='",$sdnType->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }

     

  		print $fh " ON DUPLICATE KEY UPDATE ";


  		
  	#logic to decide if firstName is defined
  	if (defined $firstName) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh "firstName='",$firstName->to_literal, "', " ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	

  		
  	#logic to decide if node name is defined
  	if (defined $lastName) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh "lastName='",$lastName->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	

  		
  	#logic to decide if title is defined
  	if (defined $title) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", title='",$title->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }

  		
  	#logic to decide if remarks is defined
  	if (defined $remarks) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", remarks='",$remarks->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; } 	
  		
  		
  	#logic to decide if sdnType is defined
  	if (defined $sdnType) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", sdnType='",$sdnType->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }




    			
  		print $fh " ;\n"
	 }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
 
	foreach my $addressEntry ($sdnEntry->findnodes('./addressList/address')) {
	
	my($auid) = $addressEntry->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $auid) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO address set uid=", $auid->to_literal, ", "; 
		# ending uid where tag
  		print $fh "sdn_id=",$uid->to_literal;				
		
		# search in address1 node
		my($address1) = $addressEntry->findnodes('./address1');
  		
  		#logic to decide if address1 is defined
  		if (defined $address1) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", address1='",$address1->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in address2 node
		my($address2) = $addressEntry->findnodes('./address2');
  		
  		#logic to decide if address2 is defined
  		if (defined $address2) {
  			
  		#if address2 is defined, print $fh sql set clause		
    	print $fh ", address2='",$address2->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in address3 node
		my($address3) = $addressEntry->findnodes('./address3');
  		
  		#logic to decide if node name is defined
  		if (defined $address3) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", address3='",$address3->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in city node
		my($city) = $addressEntry->findnodes('./city');
  		
  		#logic to decide if node name is defined
  		if (defined $city) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", city='",$city->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in stateOrProvince node
		my($stateOrProvince) = $addressEntry->findnodes('./stateOrProvince');
  		
  		#logic to decide if node name is defined
  		if (defined $stateOrProvince) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", stateOrProvince='",$stateOrProvince->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
     	
     	
    	# search in postalCode node
		my($postalCode) = $addressEntry->findnodes('./postalCode');
  		
  		#logic to decide if node name is defined
  		if (defined $postalCode) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", postalCode='",$postalCode->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in country node
		my($country) = $addressEntry->findnodes('./country');
  		
  		#logic to decide if node name is defined
  		if (defined $country) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", country='",$country->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";


  		#logic to decide if address1 is defined
  		if (defined $address1) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", address1='",$address1->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if address2 is defined
  		if (defined $address2) {
  			
  		#if address2 is defined, print $fh sql set clause		
    	print $fh ", address2='",$address2->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $address3) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", address3='",$address3->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $city) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", city='",$city->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $stateOrProvince) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", stateOrProvince='",$stateOrProvince->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
     	
  		
  		#logic to decide if node name is defined
  		if (defined $postalCode) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", postalCode='",$postalCode->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
  		
  		#logic to decide if node name is defined
  		if (defined $country) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", country='",$country->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }    	
    	
    	
    	print $fh ";\n"
    	   	
 		}
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}
	
	
	foreach my $idListEntry ($sdnEntry->findnodes('./idList/id')) {
	
	my($iuid) = $idListEntry->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $iuid) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO idList set uid=", $iuid->to_literal, ", ";
  	  	print $fh "sdn_id = ", $uid->to_literal, " "; 
						
		
		# search in idType node
		my($idType) = $idListEntry->findnodes('./idType');
  		
  		#logic to decide if node name is defined
  		if (defined $idType) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", idType='",$idType->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in idNumber node
		my($idNumber) = $idListEntry->findnodes('./idNumber');
  		
  		#logic to decide if node name is defined
  		if (defined $idNumber) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", idNumber='",$idNumber->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in idCountry node
		my($idCountry) = $idListEntry->findnodes('./idCountry');
  		
  		#logic to decide if node name is defined
  		if (defined $idCountry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", idCountry='",$idCountry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in issueDate node
		my($issueDate) = $idListEntry->findnodes('./issueDate');
  		
  		#logic to decide if node name is defined
  		if (defined $issueDate) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", issueDate='",$issueDate->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in expirationDate node
		my($expirationDate) = $idListEntry->findnodes('./expirationDate');
  		
  		#logic to decide if node name is defined
  		if (defined $expirationDate) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", expirationDate='",$expirationDate->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }   	
  
  
  
  
      	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";
  
  
  		
  		#logic to decide if node name is defined
  		if (defined $idType) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", idType='",$idType->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
   		#logic to decide if node name is defined
  		if (defined $idNumber) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", idNumber='",$idNumber->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    			
  		#logic to decide if node name is defined
  		if (defined $idCountry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", idCountry='",$idCountry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	 		
  		#logic to decide if node name is defined
  		if (defined $issueDate) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", issueDate='",$issueDate->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	  		
  		#logic to decide if node name is defined
  		if (defined $expirationDate) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", expirationDate='",$expirationDate->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }   	
  
    			
  		
  	# ending uid where tag
  	print $fh ";\n" ; }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}


	foreach my $akaListEntry ($sdnEntry->findnodes('./akaList/aka')) {
	
	my($akauid) = $akaListEntry->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $akauid) {
	
		#if defined, opening update statement
	  	print $fh "INSERT INTO akaList set uid=", $akauid->to_literal, ", ";
  	  	print $fh "sdn_id = ", $uid->to_literal, " "; 					
		
		# search in type node
		my($type) = $akaListEntry->findnodes('./type');
  		
  		#logic to decide if node name is defined
  		if (defined $type) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", type='",$type->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in category node
		my($category) = $akaListEntry->findnodes('./category');
  		
  		#logic to decide if node name is defined
  		if (defined $category) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", category='",$category->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in lastName node
		my($lastName) = $akaListEntry->findnodes('./lastName');
  		
  		#logic to decide if node name is defined
  		if (defined $lastName) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", lastName='",$lastName->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in firstName node
		my($firstName) = $akaListEntry->findnodes('./firstName');
  		
  		#logic to decide if firstName is defined
  		if (defined $firstName) {
  		
  		#if firstName is defined, print $fh sql set clause		
    	print $fh ", firstName='",$firstName->to_literal, "'" ;
    	}
    	#if firstName is not defined, print $fh nothing
    	else { print $fh ""; }	
    			
 
       	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";
 
  		
  		#logic to decide if node name is defined
  		if (defined $type) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", type='",$type->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $category) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", category='",$category->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $lastName) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", lastName='",$lastName->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		#logic to decide if firstName is defined
  		if (defined $firstName) {
  		
  		#if firstName is defined, print $fh sql set clause		
    	print $fh ", firstName='",$firstName->to_literal, "'" ;
    	}
    	#if firstName is not defined, print $fh nothing
    	else { print $fh ""; }	
 
 
  		
  	# ending uid where tag
  	print $fh ";\n" ; }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}


	foreach my $vesselListEntry ($sdnEntry->findnodes('./vesselInfo')) {
	
	my($vtype) = $vesselListEntry->findnodes('./vesselType');	

	#logic to decide of uid is defined
	if (defined $vtype) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO vesselInfo set sdn_id = ", $uid->to_literal, " "; 
						
		
		# search in callSign node
		my($callSign) = $vesselListEntry->findnodes('./callSign');
  		
  		#logic to decide if node name is defined
  		if (defined $callSign) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", callSign='",$callSign->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in vesselType node
		my($vesselType) = $vesselListEntry->findnodes('./vesselType');
  		
  		#logic to decide if node name is defined
  		if (defined $vesselType) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", vesselType='",$vesselType->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in vesselFlag node
		my($vesselFlag) = $vesselListEntry->findnodes('vesselFlag');
  		
  		#logic to decide if node name is defined
  		if (defined $vesselFlag) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", vesselFlag='",$vesselFlag->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in vesselOwner node
		my($vesselOwner) = $vesselListEntry->findnodes('./vesselOwner');
  		
  		#logic to decide if node name is defined
  		if (defined $vesselOwner) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", vesselOwner='",$vesselOwner->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }	
     	
    	
    	# search in tonnage node
		my($tonnage) = $vesselListEntry->findnodes('./tonnage');
  		
  		#logic to decide if node name is defined
  		if (defined $tonnage) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", tonnage='",$tonnage->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }	
    	
    	
      	
    	
    	# search in grossRegisteredTonnage node
		my($grossRegisteredTonnage) = $vesselListEntry->findnodes('./grossRegisteredTonnage');
  		
  		#logic to decide if node name is defined
  		if (defined $grossRegisteredTonnage) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", grossRegisteredTonnage='",$grossRegisteredTonnage->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }	  	
    
    
    print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " "; 
    
  		
  		#logic to decide if node name is defined
  		if (defined $callSign) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", callSign='",$callSign->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		#logic to decide if node name is defined
  		if (defined $vesselType) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", vesselType='",$vesselType->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
  		
  		#logic to decide if node name is defined
  		if (defined $vesselFlag) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", vesselFlag='",$vesselFlag->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $vesselOwner) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", vesselOwner='",$vesselOwner->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }	
     	
  		
  		#logic to decide if node name is defined
  		if (defined $tonnage) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", tonnage='",$tonnage->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $grossRegisteredTonnage) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", grossRegisteredTonnage='",$grossRegisteredTonnage->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }	 
    
    
    	   			
  		
  	# ending uid where tag
  		print $fh ";\n"; }
  	
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}

foreach my $nationalityList ($sdnEntry->findnodes('./nationalityList/nationality')) {
	
	my($natuid) = $nationalityList->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $natuid) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO nationality set uid=", $natuid->to_literal, ", ";
  	  	print $fh "sdn_id = ", $uid->to_literal, " "; 						
		
		# search in country node
		my($country) = $nationalityList->findnodes('./country');
  		
  		#logic to decide if node name is defined
  		if (defined $country) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", country='",$country->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in mainEntry node
		my($mainEntry) = $nationalityList->findnodes('./mainEntry');
  		
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
       	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";   	

  		
  		#logic to decide if node name is defined
  		if (defined $country) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", country='",$country->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }



   
  	# ending uid where tag
  	print $fh ";\n" ; }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}

foreach my $citizenshipList ($sdnEntry->findnodes('./citizenshipList/citizenship')) {
	
	my($cituid) = $citizenshipList->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $cituid) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO citizenship set uid=", $cituid->to_literal, ", ";
  	  	print $fh "sdn_id = ", $uid->to_literal, " "; 						
		
		# search in country node
		my($country) = $citizenshipList->findnodes('./country');
  		
  		#logic to decide if node name is defined
  		if (defined $country) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", country='",$country->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in mainEntry node
		my($mainEntry) = $citizenshipList->findnodes('./mainEntry');
  		
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";    	

  		
  		#logic to decide if node name is defined
  		if (defined $country) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", country='",$country->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
  		
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	
   
  	# ending uid where tag
  	print $fh ";\n" ; }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}

foreach my $dateOfBirthList ($sdnEntry->findnodes('./dateOfBirthList/dateOfBirthItem')) {
	
	my($birthuid) = $dateOfBirthList->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $birthuid) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO dateOfBirth set uid=", $birthuid->to_literal, ", ";
  	  	print $fh "sdn_id = ", $uid->to_literal, " "; 						
		
		# search in country node
		my($dateOfBirth) = $dateOfBirthList->findnodes('./dateOfBirth');
  		
  		#logic to decide if node name is defined
  		if (defined $dateOfBirth) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", dateOfBirth='",$dateOfBirth->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in mainEntry node
		my($mainEntry) = $dateOfBirthList->findnodes('./mainEntry');
  		
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }


    	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";  

		
  		#logic to decide if node name is defined
  		if (defined $dateOfBirth) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", dateOfBirth='",$dateOfBirth->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }



   
  	# ending uid where tag
  	print $fh ";\n" ; }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}


foreach my $placeOfBirthList ($sdnEntry->findnodes('./placeOfBirthList/placeOfBirthItem')) {
	
	my($placeuid) = $placeOfBirthList->findnodes('./uid');	

	#logic to decide of uid is defined
	if (defined $placeuid) {
	
		#if defined, opening upplace statement
  	  	print $fh "INSERT INTO placeOfBirth set uid=", $placeuid->to_literal, ", ";
  	  	print $fh "sdn_id = ", $uid->to_literal, " "; 							
		
		# search in country node
		my($placeOfBirth) = $placeOfBirthList->findnodes('./placeOfBirth');
  		
  		#logic to decide if node name is defined
  		if (defined $placeOfBirth) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", placeOfBirth='",$placeOfBirth->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
    	# search in mainEntry node
		my($mainEntry) = $placeOfBirthList->findnodes('./mainEntry');
  		
  		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
 
     	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " "; 
 
 		
  		#logic to decide if node name is defined
  		if (defined $placeOfBirth) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", placeOfBirth='",$placeOfBirth->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	
		#logic to decide if node name is defined
  		if (defined $mainEntry) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", mainEntry='",$mainEntry->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
   
  	# ending uid where tag
  	print $fh ";\n" ; }
  		
 	#case when there is no uid
    else { print $fh "\n"; }
		
	}
	

	foreach my $programEntry ($sdnEntry->findnodes('./programList')) {
	
	my($program) = $programEntry->findnodes('./program');	

	#logic to decide of uid is defined
	if (defined $program) {
	
		#if defined, opening update statement
  	  	print $fh "INSERT INTO program set sdn_id = ", $uid->to_literal, " "; 
						
		
		# search in callSign node
		my($programname) = $programEntry->findnodes('./program');
  		
  		#logic to decide if node name is defined
  		if (defined $programname) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", program='",$programname->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
	
     	print $fh " ON DUPLICATE KEY UPDATE sdn_id = ", $uid->to_literal, " ";     	   			
 		
  		
  		#logic to decide if node name is defined
  		if (defined $programname) {
  			
  		#if node is defined, print $fh sql set clause		
    	print $fh ", program='",$programname->to_literal, "'" ;
    	}
    	#if node is not defined, print $fh nothing
    	else { print $fh ""; }
    	
    	 		
  		# ending uid where tag
  		print $fh ";\n"; }
  	
 		#case when there is no uid
   		else { print $fh "\n"; }
	}
	

 
 
 	my($pfremarks) = $sdnEntry->findnodes('./remarks');
  		
  		#logic to decide if remarks is defined
  		if (defined $pfremarks) {
  			
  			#if last name is defined, print $fh sql set clause		
    		my($cuid)=$uid->to_literal;
    		my($remstring) = $pfremarks->to_literal;


    		my @phonelist = split(/;/, $remstring);

    		foreach my $val (@phonelist) {
    			if ($val =~ m/phone/i) {
    				$val =~ s/(\D)//g;
    				print $fh "INSERT INTO phoneFax SET sdn_id=", $cuid, ", type='phone', number='", $val, "' ON DUPLICATE KEY UPDATE sdn_id=", $cuid, ", type='phone', number='", $val,"';\n";
  				}
  				else {print $fh ""}
  			}
  			
  			
  			foreach my $val (@phonelist) {
    			if ($val =~ m/fax/i) {
    				$val =~ s/(\D)//g;
    				print $fh "INSERT INTO phoneFax SET sdn_id=", $cuid, ", type='fax', number='", $val, "' ON DUPLICATE KEY UPDATE sdn_id=", $cuid, ", type='fax', number='", $val,"';\n";
  				}
  				else {print $fh  ""}
  			}
    	
    	}
    	
    	
  	my($wfremarks) = $sdnEntry->findnodes('./remarks');
  		
  		#logic to decide if remarks is defined
  		if (defined $wfremarks) {
  			
  			#if last name is defined, print $fh sql set clause		
    		my($cuid)=$uid->to_literal;
    		my($remstring) = $wfremarks->to_literal;


    		my @phonelist = split(/ /, $remstring);

			foreach my $val (@phonelist) {
    			if ($val =~ m/www/i) {
    				#$val =~ s/(\D)//g;
    				print $fh "INSERT INTO idList SET sdn_id=", $cuid, ", idType='website', idNumber='", $val, "' ON DUPLICATE KEY UPDATE sdn_id=", $cuid, ", idType='website', idNumber='", $val,"';\n";
  				}
  				else {print $fh ""}
  			}
    	
    	}
    
   	 #if last name is not defined, print $fh nothing
   	 else { print ""; }  	
    	
    	
    	
  print $fh "\n"; 

}

print "closing file... \n";
close $fh;

print "done...\n";
