;------------------------------------------------------------------------------
; Fix for -ign instead of -ing.
; Words to exclude: (could probably do this by return without rewrite)
; From: http://www.morewords.com/e nds-with/gn/
;------------------------------------------------------------------------------
#Hotstring B0  ; Turns off automatic backspacing for the following hotstrings.
::align::
::antiforeign::
::arraign::
::assign::
::benign::
::campaign::
::champaign::
::codesign::
::coign::
::condign::
::consign::
::coreign::
::cosign::
::countercampaign::
::countersign::
::deign::
::deraign::
::design::
::eloign::
::ensign::
::feign::
::foreign::
::indign::
::malign::
::misalign::
::outdesign::
::overdesign::
::preassign::
::realign::
::reassign::
::redesign::
::reign::
::resign::
::sign::
::sovereign::
::unbenign::
::verisign::
return  ; This makes the above hotstrings do nothing so that they override the ign->ing rule below.

#Hotstring B  ; Turn back on automatic backspacing for all subsequent hotstrings.
:?:ign::ing


;------------------------------------------------------------------------------
; Word endings
;------------------------------------------------------------------------------
:?:bilites::bilities
:?:bilties::bilities
:?:blities::bilities
:?:bilty::bility
:?:blity::bility
:?:, btu::, but ; Not just replacing "btu", as that is a unit of heat.
:?:; btu::; but
:?:n;t::n't
:?:;ll::'ll
:?:;re::'re
:?:;ve::'ve
::sice::since  ; Must precede the following line!
:?:sice::sive
:?:t eh:: the
:?:t hem:: them


;------------------------------------------------------------------------------
; Word beginnings
;------------------------------------------------------------------------------
:*:abondon::abandon
:*:abreviat::abbreviat
:*:accomadat::accommodat
:*:accomodat::accommodat
:*:acheiv::achiev
:*:achievment::achievement
:*:acquaintence::acquaintance
:*:adquir::acquir
:*:aquisition::acquisition
:*:agravat::aggravat
:*:allign::align
:*:ameria::America
:*:archaelog::archaeolog
:*:archtyp::archetyp
:*:archetect::architect
:*:arguement::argument
:*:assasin::assassin
:*:asociat::associat
:*:assymetr::asymmet
:*:atempt::attempt
:*:atribut::attribut
:*:avaialb::availab
:*:comision::commission
:*:contien::conscien
:*:critisi::critici
:*:crticis::criticis
:*:critiz::criticiz
:*:desicant::desiccant
:*:desicat::desiccat
::develope::develop  ; Omit asterisk so that it doesn't disrupt the typing of developed/developer.
:*:dissapoint::disappoint
:*:divsion::division
:*:dcument::document
:*:embarass::embarrass
:*:emminent::eminent
:*:empahs::emphas
:*:enlargment::enlargement
:*:envirom::environm
:*:enviorment::environment
:*:excede::exceed
:*:exilerat::exhilarat
:*:extraterrestial::extraterrestrial
:*:faciliat::facilitat
:*:garantee::guaranteed
:*:guerrila::guerrilla
:*:guidlin::guidelin
:*:girat::gyrat
:*:harasm::harassm
:*:immitat::imitat
:*:imigra::immigra
:*:impliment::implement
:*:inlcud::includ
:*:indenpenden::independen
:*:indisputib::indisputab
:*:isntall::install
:*:insitut::institut
:*:knwo::know
:*:lsit::list
:*:mountian::mountain
:*:nmae::name
:*:necassa::necessa
:*:negociat::negotiat
:*:neigbor::neighbour
:*:noticibl::noticeabl
:*:ocasion::occasion
:*:occuranc::occurrence
:*:priveledg::privileg
:*:recie::recei
:*:recived::received
:*:reciver::receiver
:*:recepient::recipient
:*:reccomend::recommend
:*:recquir::requir
:*:requirment::requirement
:*:respomd::respond
:*:repons::respons
:*:ressurect::resurrect
:*:seperat::separat
:*:sevic::servic
:*:smoe::some
:*:supercede::supersede
:*:superceed::supersede
:*:weild::wield


;------------------------------------------------------------------------------
; Word middles
;------------------------------------------------------------------------------
:?*:compatab::compatib  ; Covers incompat* and compat*
:?*:catagor::categor  ; Covers subcatagories and catagories.


;------------------------------------------------------------------------------
; Accented English words, from, amongst others,
; http://en.wikipedia.org/wiki/List_of_English_words_with_diacritics
; I have included all the ones compatible with reasonable codepages, and placed
; those that may often not be accented either from a clash with an unaccented 
; word (resume), or because the unaccented version is now common (cafe).
;------------------------------------------------------------------------------

;------------------------------------------------------------------------------
; Common Misspellings - the main list
;------------------------------------------------------------------------------
::htp:::http:
::http:\\::http://
::httpL::http:
::herf::href

::avengence::a vengeance
::adbandon::abandon
::abandonned::abandoned
::aberation::aberration
::aborigene::aborigine
::abortificant::abortifacient
::abbout::about
::abotu::about
::baout::about
::abouta::about a
::aboutit::about it
::aboutthe::about the
::abscence::absence
::absense::absence
::abcense::absense
::absolutly::absolutely
::asorbed::absorbed
::absorbsion::absorption
::absorbtion::absorption
::abundacies::abundances
::abundancies::abundances
::abundunt::abundant
::abutts::abuts
::acadmic::academic
::accademic::academic
::acedemic::academic
::acadamy::academy
::accademy::academy
::accelleration::acceleration
::acceptible::acceptable
::acceptence::acceptance
::accessable::accessible
::accension::accession
::accesories::accessories
::accesorise::accessorise
::accidant::accident
::accidentaly::accidentally
::accidently::accidentally
::acclimitization::acclimatization
::accomdate::accommodate
::accomodate::accommodate
::acommodate::accommodate
::acomodate::accommodate
::accomodated::accommodated
::accomodates::accommodates
::accomodating::accommodating
::accomodation::accommodation
::accomodations::accommodations
::accompanyed::accompanied
::acomplish::accomplish
::acomplished::accomplished
::acomplishment::accomplishment
::acomplishments::accomplishments
::accoring::according
::acording::according
::accordingto::according to
::acordingly::accordingly
::accordeon::accordion
::accordian::accordion
::acocunt::account
::acuracy::accuracy
::acccused::accused
::accussed::accused
::acused::accused
::acustom::accustom
::acustommed::accustomed
::achive::achieve
::achivement::achievement
::achivements::achievements
::acknowldeged::acknowledged
::acknowledgeing::acknowledging
::accoustic::acoustic
::acquiantence::acquaintance
::aquaintance::acquaintance
::aquiantance::acquaintance
::acquiantences::acquaintances
::accquainted::acquainted
::aquainted::acquainted
::aquire::acquire
::aquired::acquired
::aquiring::acquiring
::aquit::acquit
::acquited::acquitted
::aquitted::acquitted
::accross::across
::activly::actively
::activites::activities
::actualy::actually
::actualyl::actually
::adaption::adaptation
::adaptions::adaptations
::addtion::addition
::additinal::additional
::addtional::additional
::additinally::additionally
::addres::address
::adres::address
::adress::address
::addresable::addressable
::adresable::addressable
::adressable::addressable
::addresed::addressed
::adressed::addressed
::addressess::addresses
::addresing::addressing
::adresing::addressing
::adecuate::adequate
::adequit::adequate
::adequite::adequate
::adherance::adherence
::adhearing::adhering
::adminstered::administered
::adminstrate::administrate
::adminstration::administration
::admininistrative::administrative
::adminstrative::administrative
::adminstrator::administrator
::admissability::admissibility
::admissable::admissible
::addmission::admission
::admited::admitted
::admitedly::admittedly
::adolecent::adolescent
::addopt::adopt
::addopted::adopted
::addoptive::adoptive
::adavanced::advanced
::adantage::advantage
::advanage::advantage
::adventrous::adventurous
::advesary::adversary
::advertisment::advertisement
::advertisments::advertisements
::asdvertising::advertising
::adviced::advised
::aeriel::aerial
::aeriels::aerials
::areodynamics::aerodynamics
::asthetic::aesthetic
::asthetical::aesthetic
::asthetically::aesthetically
::afair::affair
::affilate::affiliate
::affilliate::affiliate
::afficionado::aficionado
::afficianados::aficionados
::afficionados::aficionados
::aforememtioned::aforementioned
::affraid::afraid
::afterthe::after the
::agian::again
::agin::again
::againnst::against
::agains::against
::agaisnt::against
::aganist::against
::agianst::against
::aginst::against
::againstt he::against the
::aggaravates::aggravates
::agregate::aggregate
::agregates::aggregates
::agression::aggression
::aggresive::aggressive
::agressive::aggressive
::agressively::aggressively
::agressor::aggressor
::agrieved::aggrieved
::agre::agree
::aggreed::agreed
::agred::agreed
::agreing::agreeing
::aggreement::agreement
::agreeement::agreement
::agreemeent::agreement
::agreemnet::agreement
::agreemnt::agreement
::agreemeents::agreements
::agreemnets::agreements
::agricuture::agriculture
::airbourne::airborne
::aicraft::aircraft
::aircaft::aircraft
::aircrafts::aircraft
::airrcraft::aircraft
::aiport::airport
::airporta::airports
::albiet::albeit
::alchohol::alcohol
::alchol::alcohol
::alcohal::alcohol
::alochol::alcohol
::alchoholic::alcoholic
::alcholic::alcoholic
::alcoholical::alcoholic
::algebraical::algebraic
::algoritm::algorithm
::algorhitms::algorithms
::algoritms::algorithms
::alientating::alienating
::alltime::all-time
::aledge::allege
::alege::allege
::alledge::allege
::aledged::alleged
::aleged::alleged
::alledged::alleged
::alledgedly::allegedly
::allegedely::allegedly
::allegedy::allegedly
::allegely::allegedly
::aledges::alleges
::alledges::alleges
::alegience::allegiance
::allegence::allegiance
::allegience::allegiance
::alliviate::alleviate
::allopone::allophone
::allopones::allophones
::alotted::allotted
::alowed::allowed
::alowing::allowing
::alusion::allusion
::almots::almost
::almsot::almost
::alomst::almost
::alonw::alone
::allready::already
::alraedy::already
::alreayd::already
::alreday::already
::aready::already
::alsation::Alsatian
::alsot::also
::aslo::also
::alternitives::alternatives
::allthough::although
::altho::although
::althought::although
::altough::although
::allwasy::always
::allwyas::always
::alwasy::always
::alwats::always
::alway::always
::alwyas::always
::amalgomated::amalgamated
::amatuer::amateur
::amerliorate::ameliorate
::ammend::amend
::ammended::amended
::admendment::amendment
::amendmant::amendment
::ammendment::amendment
::ammendments::amendments
::amoung::among
::amung::among
::amoungst::amongst
::ammount::amount
::ammused::amused
::analagous::analogous
::analogeous::analogous
::analitic::analytic
::anarchim::anarchism
::anarchistm::anarchism
::ansestors::ancestors
::ancestory::ancestry
::ancilliary::ancillary
::adn::and
::anbd::and
::anmd::and
::andone::and one
::andt he::and the
::andteh::and the
::andthe::and the
::androgenous::androgynous
::androgeny::androgyny
::anihilation::annihilation
::aniversary::anniversary
::annouced::announced
::anounced::announced
::anual::annual
::annualy::annually
::annuled::annulled
::anulled::annulled
::annoint::anoint
::annointed::anointed
::annointing::anointing
::annoints::anoints
::anomolies::anomalies
::anomolous::anomalous
::anomoly::anomaly
::anonimity::anonymity
::anohter::another
::anotehr::another
::anothe::another
::anwsered::answered
::antartic::antarctic
::anthromorphisation::anthropomorphisation
::anthromorphization::anthropomorphization
::anti-semetic::anti-Semitic
::anyother::any other
::anytying::anything
::anyhwere::anywhere
::appart::apart
::aparment::apartment
::appartment::apartment
::appartments::apartments
::apenines::Apennines
::appenines::Apennines
::apolegetics::apologetics
::appologies::apologies
::appology::apology
::aparent::apparent
::apparant::apparent
::apparrent::apparent
::apparantly::apparently
::appealling::appealing
::appeareance::appearance
::appearence::appearance
::apperance::appearance
::apprearance::appearance
::appearences::appearances
::apperances::appearances
::appeares::appears
::aplication::application
::applicaiton::application
::applicaitons::applications
::aplied::applied
::applyed::applied
::appointiment::appointment
::apprieciate::appreciate
::aprehensive::apprehensive
::approachs::approaches
::appropiate::appropriate
::appropraite::appropriate
::appropropiate::appropriate
::approrpiate::appropriate
::approrpriate::appropriate
::apropriate::appropriate
::approproximate::approximate
::aproximate::approximate
::approxamately::approximately
::approxiately::approximately
::approximitely::approximately
::aproximately::approximately
::arbitarily::arbitrarily
::abritrary::arbitrary
::arbitary::arbitrary
::arbouretum::arboretum
::archiac::archaic
::archimedian::Archimedean
::archictect::architect
::archetectural::architectural
::architectual::architectural
::archetecturally::architecturally
::architechturally::architecturally
::archetecture::architecture
::architechture::architecture
::architechtures::architectures
::arn't::aren't
::argubly::arguably
::armamant::armament
::armistace::armistice
::arised::arose
::arond::around
::aroud::around
::arround::around
::arund::around
::aranged::arranged
::arangement::arrangement
::arrangment::arrangement
::arrangments::arrangements
::arival::arrival
::artical::article
::artice::article
::articel::article
::artifical::artificial
::artifically::artificially
::artillary::artillery
::asthe::as the
::aswell::as well
::asetic::ascetic
::aisian::Asian
::asside::aside
::askt he::ask the
::asphyxation::asphyxiation
::assisnate::assassinate
::assassintation::assassination
::assosication::assassination
::asssassans::assassins
::assualt::assault
::assualted::assaulted
::assemple::assemble
::assertation::assertion
::assesment::assessment
::asign::assign
::assit::assist
::assistent::assistant
::assitant::assistant
::assoicate::associate
::assoicated::associated
::assoicates::associates
::assocation::association
::asume::assume
::asteriod::asteroid
::atthe::at the
::athiesm::atheism
::athiest::atheist
::atheistical::atheistic
::athenean::Athenian
::atheneans::Athenians
::atmospher::atmosphere
::attrocities::atrocities
::attatch::attach
::atain::attain
::attemp::attempt
::attemt::attempt
::attemped::attempted
::attemted::attempted
::attemting::attempting
::attemts::attempts
::attendence::attendance
::attendent::attendant
::attendents::attendants
::attened::attended
::atention::attention
::attension::attention
::attentioin::attention
::attitide::attitude
::atorney::attorney
::attributred::attributed
::audeince::audience
::audiance::audience
::austrailia::Australia
::austrailian::Australian
::australian::Australian
::auther::author
::autor::author
::authorative::authoritative
::authoritive::authoritative
::authorites::authorities
::authoritiers::authorities
::authrorities::authorities
::authorithy::authority
::autority::authority
::authobiographic::autobiographic
::authobiography::autobiography
::autochtonous::autochthonous
::autoctonous::autochthonous
::automaticly::automatically
::automibile::automobile
::automonomous::autonomous
::auxillaries::auxiliaries
::auxilliaries::auxiliaries
::auxilary::auxiliary
::auxillary::auxiliary
::auxilliary::auxiliary
::availablility::availability
::availaible::available
::availalbe::available
::availble::available
::availiable::available
::availible::available
::avalable::available
::avaliable::available
::avilable::available
::avalance::avalanche
::averageed::averaged
::avation::aviation
::awared::awarded
::awya::away
::aywa::away
::abck::back
::bakc::back
::bcak::back
::backgorund::background
::backrounds::backgrounds
::balence::balance
::ballance::balance
::banannas::bananas
::bandwith::bandwidth
::bankrupcy::bankruptcy
::banruptcy::bankruptcy
::barbeque::barbecue
::basicaly::basically
::basicly::basically
::cattleship::battleship
::bve::be
::eb::be
::beachead::beachhead
::beatiful::beautiful
::beautyfull::beautiful
::beutiful::beautiful
::becamae::became
::baceause::because
::beacuse::because
::becasue::because
::becaus::because
::beccause::because
::becouse::because
::becuase::because
::becuse::because
::becausea::because a
::becauseof::because of
::becausethe::because the
::becauseyou::because you
::becoe::become
::becomeing::becoming
::becomming::becoming
::bedore::before
::befoer::before
::begginer::beginner
::begginers::beginners
::beggining::beginning
::begining::beginning
::beginining::beginning
::beginnig::beginning
::begginings::beginnings
::beggins::begins
::behavour::behaviour
::beng::being
::beleagured::beleaguered
::beligum::belgium
::beleif::belief
::beleiev::believe
::beleieve::believe
::beleive::believe
::belive::believe
::beleived::believed
::belived::believed
::beleives::believes
::beleiving::believing
::belligerant::belligerent
::bellweather::bellwether
::bemusemnt::bemusement
::benefical::beneficial
::benificial::beneficial
::beneficary::beneficiary
::benifit::benefit
::benifits::benefits
::bergamont::bergamot
::bernouilli::Bernoulli
::beseige::besiege
::beseiged::besieged
::beseiging::besieging
::beastiality::bestiality
::betweeen::between
::betwen::between
::bewteen::between
::inbetween::between
::vetween::between
::bicep::biceps
::bilateraly::bilaterally
::billingualism::bilingualism
::binominal::binomial
::bizzare::bizarre
::blaim::blame
::blaimed::blamed
::blessure::blessing
::blitzkreig::Blitzkrieg
::bodydbuilder::bodybuilder
::bombardement::bombardment
::bombarment::bombardment
::bonnano::Bonanno
::bondary::boundary
::boundry::boundary
::boxs::boxes
::brasillian::Brazilian
::breakthough::breakthrough
::breakthroughts::breakthroughs
::brethen::brethren
::bretheren::brethren
::breif::brief
::breifly::briefly
::briliant::brilliant
::brillant::brilliant
::brimestone::brimstone
::britian::Britain
::brittish::British
::broacasted::broadcast
::brodcast::broadcast
::broadacasting::broadcasting
::broady::broadly
::borke::broke
::buddah::Buddha
::bouy::buoy
::bouyancy::buoyancy
::buoancy::buoyancy
::bouyant::buoyant
::boyant::buoyant
::beaurocracy::bureaucracy
::beaurocratic::bureaucratic
::burried::buried
::buisness::business
::busness::business
::bussiness::business
::busineses::businesses
::buisnessman::businessman
::butthe::but the
::byt he::by the
::ceasar::Caesar
::casion::caisson
::caluclate::calculate
::caluculate::calculate
::calulate::calculate
::calcullated::calculated
::caluclated::calculated
::caluculated::calculated
::calulated::calculated
::calculs::calculus
::calander::calendar
::calenders::calendars
::califronia::California
::califronian::Californian
::caligraphy::calligraphy
::callipigian::callipygian
::cambrige::Cambridge
::camoflage::camouflage
::campain::campaign
::campains::campaigns
::acn::can
::cna::can
::cxan::can
::can't of::can't have
::candadate::candidate
::candiate::candidate
::candidiate::candidate
::candidtae::candidate
::candidtaes::candidates
::cannister::canister
::cannisters::canisters
::cannnot::cannot
::cannonical::canonical
::cantalope::cantaloupe
::caperbility::capability
::capible::capable
::capetown::Cape Town
::captial::capital
::captued::captured
::capturd::captured
::carcas::carcass
::carreer::career
::carrers::careers
::carefull::careful
::carribbean::Caribbean
::carribean::Caribbean
::careing::caring
::carmalite::Carmelite
::carniverous::carnivorous
::carthagian::Carthaginian
::cartilege::cartilage
::cartilidge::cartilage
::carthographer::cartographer
::cartdridge::cartridge
::cartrige::cartridge
::casette::cassette
::cassawory::cassowary
::cassowarry::cassowary
::casulaties::casualties
::causalities::casualties
::casulaty::casualty
::categiory::category
::ctaegory::category
::catterpilar::caterpillar
::catterpilars::caterpillars
::cathlic::catholic
::catholocism::catholicism
::caucasion::Caucasian
::cacuses::caucuses
::cieling::ceiling
::cellpading::cellpadding
::celcius::Celsius
::cemetaries::cemeteries
::cementary::cemetery
::cemetarey::cemetery
::cemetary::cemetery
::sensure::censure
::cencus::census
::cententenial::centennial
::centruies::centuries
::centruy::century
::cerimonial::ceremonial
::cerimonies::ceremonies
::cerimonious::ceremonious
::cerimony::ceremony
::ceromony::ceremony
::certian::certain
::certainity::certainty
::chariman::chairman
::challange::challenge
::challege::challenge
::challanged::challenged
::challanges::challenges
::chalenging::challenging
::champange::champagne
::chaneg::change
::chnage::change
::changable::changeable
::chanegs::changes
::changeing::changing
::changng::changing
::caharcter::character
::carachter::character
::charachter::character
::charactor::character
::charecter::character
::charector::character
::chracter::character
::caracterised::characterised
::charaterised::characterised
::charactersistic::characteristic
::charistics::characteristics
::caracterized::characterized
::charaterized::characterized
::cahracters::characters
::charachters::characters
::charactors::characters
::carismatic::charismatic
::charasmatic::charismatic
::chartiable::charitable
::caht::chat
::chekc::check
::chemcial::chemical
::chemcially::chemically
::chemicaly::chemically
::chemestry::chemistry
::cheif::chief
::childbird::childbirth
::childen::children
::childrens::children's
::chilli::chili
::choosen::chosen
::chuch::church
::curch::church
::churchs::churches
::cincinatti::Cincinnati
::cincinnatti::Cincinnati
::circut::circuit
::ciricuit::circuit
::curcuit::circuit
::circulaton::circulation
::circumsicion::circumcision
::sercumstances::circumstances
::cirtus::citrus
::civillian::civilian
::claimes::claims
::clas::class
::clasic::classic
::clasical::classical
::clasically::classically
::claer::clear
::cleareance::clearance
::claered::cleared
::claerer::clearer
::claerly::clearly
::cliant::client
::clincial::clinical
::clinicaly::clinically
::caost::coast
::coctail::cocktail
::cognizent::cognizant
::co-incided::coincided
::coincedentally::coincidentally
::colaborations::collaborations
::collaberative::collaborative
::colateral::collateral
::collegue::colleague
::collegues::colleagues
::collectable::collectible
::colection::collection
::collecton::collection
::colelctive::collective
::collonies::colonies
::colonisators::colonisers
::colonizators::colonizers
::collonade::colonnade
::collony::colony
::collosal::colossal
::colum::column
::combintation::combination
::combanations::combinations
::combinatins::combinations
::combusion::combustion
::comback::comeback
::commedic::comedic
::confortable::comfortable
::comming::coming
::commadn::command
::comander::commander
::comando::commando
::comandos::commandos
::commandoes::commandos
::comemmorate::commemorate
::commemmorate::commemorate
::commmemorated::commemorated
::comemmorates::commemorates
::commemmorating::commemorating
::comemoretion::commemoration
::commemerative::commemorative
::commerorative::commemorative
::commerical::commercial
::commericial::commercial
::commerically::commercially
::commericially::commercially
::comission::commission
::commision::commission
::comissioned::commissioned
::commisioned::commissioned
::comissioner::commissioner
::commisioner::commissioner
::comissioning::commissioning
::commisioning::commissioning
::comissions::commissions
::commisions::commissions
::comit::commit
::committment::commitment
::committments::commitments
::comited::committed
::comitted::committed
::commited::committed
::comittee::committee
::commitee::committee
::committe::committee
::committy::committee
::comiting::committing
::comitting::committing
::commiting::committing
::commongly::commonly
::commonweath::commonwealth
::comunicate::communicate
::comminication::communication
::communciation::communication
::communiation::communication
::commuications::communications
::commuinications::communications
::communites::communities
::comunity::community
::comanies::companies
::comapnies::companies
::comany::company
::comapany::company
::comapny::company
::company;s::company's
::comparitive::comparative
::comparitively::comparatively
::compair::compare
::comparision::comparison
::comparisions::comparisons
::compability::compatibility
::compatiable::compatible
::compensantion::compensation
::competance::competence
::competant::competent
::compitent::competent
::competitiion::competition
::compeitions::competitions
::competative::competitive
::competive::competitive
::competiveness::competitiveness
::copmetitors::competitors
::complier::compiler
::compleated::completed
::completedthe::completed the
::competely::completely
::compleatly::completely
::completelyl::completely
::completly::completely
::compleatness::completeness
::completness::completeness
::completetion::completion
::componant::component
::composate::composite
::comphrehensive::comprehensive
::comprimise::compromise
::compulsary::compulsory
::compulsery::compulsory
::cmoputer::computer
::coputer::computer
::computarised::computerised
::computarized::computerized
::concieted::conceited
::concieve::conceive
::concieved::conceived
::consentrate::concentrate
::consentrated::concentrated
::consentrates::concentrates
::consept::concept
::consern::concern
::conserned::concerned
::conserning::concerning
::comdemnation::condemnation
::condamned::condemned
::condemmed::condemned
::condidtion::condition
::condidtions::conditions
::conditionsof::conditions of
::condolances::condolences
::conferance::conference
::confidental::confidential
::confidentally::confidentially
::confids::confides
::configureable::configurable
::confirmmation::confirmation
::coform::conform
::congradulations::congratulations
::congresional::congressional
::conjecutre::conjecture
::conjuction::conjunction
::conected::connected
::conneticut::Connecticut
::conection::connection
::conived::connived
::cannotation::connotation
::cannotations::connotations
::conotations::connotations
::conquerd::conquered
::conqured::conquered
::conquerer::conqueror
::conquerers::conquerors
::concious::conscious
::consious::conscious
::conciously::consciously
::conciousness::consciousness
::consciouness::consciousness
::consiciousness::consciousness
::consicousness::consciousness
::consectutive::consecutive
::concensus::consensus
::conesencus::consensus
::conscent::consent
::consequeseces::consequences
::consenquently::consequently
::consequentually::consequently
::conservitive::conservative
::concider::consider
::consdider::consider
::considerit::considerate
::considerite::considerate
::concidered::considered
::consdidered::considered
::consdiered::considered
::considerd::considered
::consideres::considered
::concidering::considering
::conciders::considers
::consistant::consistent
::consistantly::consistently
::consolodate::consolidate
::consolodated::consolidated
::consonent::consonant
::consonents::consonants
::consorcium::consortium
::conspiracys::conspiracies
::conspiricy::conspiracy
::conspiriator::conspirator
::constatn::constant
::constanly::constantly
::constarnation::consternation
::consituencies::constituencies
::consituency::constituency
::constituant::constituent
::constituants::constituents
::consituted::constituted
::consitution::constitution
::constituion::constitution
::costitution::constitution
::consitutional::constitutional
::constituional::constitutional
::constaints::constraints
::consttruction::construction
::constuction::construction
::contruction::construction
::consulant::consultant
::consultent::consultant
::consumber::consumer
::consumate::consummate
::consumated::consummated
::comntain::contain
::comtain::contain
::comntains::contains
::comtains::contains
::containes::contains
::countains::contains
::contaiminate::contaminate
::contemporaneus::contemporaneous
::contamporaries::contemporaries
::contamporary::contemporary
::contempoary::contemporary
::contempory::contemporary
::contendor::contender
::constinually::continually
::contined::continued
::continueing::continuing
::continous::continuous
::continously::continuously
::contritutions::contributions
::contributer::contributor
::contributers::contributors
::controll::control
::controled::controlled
::controling::controlling
::controlls::controls
::contravercial::controversial
::controvercial::controversial
::controversal::controversial
::controvertial::controversial
::controveries::controversies
::contraversy::controversy
::controvercy::controversy
::controvery::controversy
::conveinent::convenient
::convienient::convenient
::convential::conventional
::convertion::conversion
::convertor::converter
::convertors::converters
::convertable::convertible
::convertables::convertibles
::conveyer::conveyor
::conviced::convinced
::cooparate::cooperate
::cooporate::cooperate
::coordiantion::coordination
::cpoy::copy
::copywrite::copyright
::coridal::cordial
::corparate::corporate
::corproation::corporation
::coorperations::corporations
::corperations::corporations
::corproations::corporations
::correcters::correctors
::corrispond::correspond
::corrisponded::corresponded
::correspondant::correspondent
::corrispondant::correspondent
::correspondants::correspondents
::corrispondants::correspondents
::correponding::corresponding
::correposding::corresponding
::corrisponding::corresponding
::corrisponds::corresponds
::corridoors::corridors
::corosion::corrosion
::corruptable::corruptible
::cotten::cotton
::coudl::could
::could of::could have
::couldthe::could the
::coudln't::couldn't
::coudn't::couldn't
::couldnt::couldn't
::coucil::council
::counries::countries
::countires::countries
::ocuntries::countries
::ocuntry::country
::coururier::courier
::convenant::covenant
::creaeted::created
::creedence::credence
::criterias::criteria
::critereon::criterion
::crtical::critical
::critised::criticised
::criticing::criticising
::criticists::critics
::crockodiles::crocodiles
::crucifiction::crucifixion
::crusies::cruises
::crystalisation::crystallisation
::culiminating::culminating
::cumulatative::cumulative
::currenly::currently
::ciriculum::curriculum
::curriculem::curriculum
::cusotmer::customer
::cutsomer::customer
::cusotmers::customers
::cutsomers::customers
::cxan::cyan
::cilinder::cylinder
::cyclinder::cylinder
::dakiri::daiquiri
::dalmation::dalmatian
::danceing::dancing
::dardenelles::Dardanelles
::dael::deal
::debateable::debatable
::decaffinated::decaffeinated
::decathalon::decathlon
::decieved::deceived
::decideable::decidable
::deside::decide
::decidely::decidedly
::ecidious::deciduous
::decison::decision
::descision::decision
::desicion::decision
::desision::decision
::decisons::decisions
::descisions::decisions
::desicions::decisions
::desisions::decisions
::decomissioned::decommissioned
::decomposit::decompose
::decomposited::decomposed
::decomposits::decomposes
::decompositing::decomposing
::decress::decrees
::deafult::default
::defendent::defendant
::defendents::defendants
::defencive::defensive
::deffensively::defensively
::definance::defiance
::deffine::define
::deffined::defined
::definining::defining
::definate::definite
::definit::definite
::definately::definitely
::definatly::definitely
::definetly::definitely
::definitly::definitely
::definiton::definition
::defintion::definition
::degredation::degradation
::degrate::degrade
::dieties::deities
::diety::deity
::delagates::delegates
::deliberatly::deliberately
::delerious::delirious
::delusionally::delusively
::devels::delves
::damenor::demeanor
::demenor::demeanor
::damenor::demeanour
::damenour::demeanour
::demenour::demeanour
::demorcracy::democracy
::demographical::demographic
::demolision::demolition
::demostration::demonstration
::denegrating::denigrating
::densly::densely
::deparment::department
::deptartment::department
::dependance::dependence
::dependancy::dependency
::dependant::dependent
::despict::depict
::derivitive::derivative
::deriviated::derived
::dirived::derived
::derogitory::derogatory
::decendant::descendant
::decendent::descendant
::decendants::descendants
::decendents::descendants
::descendands::descendants
::decribe::describe
::discribe::describe
::decribed::described
::descibed::described
::discribed::described
::decribes::describes
::descriibes::describes
::discribes::describes
::decribing::describing
::discribing::describing
::descriptoin::description
::descripton::description
::descripters::descriptors
::dessicated::desiccated
::disign::design
::desgined::designed
::dessigned::designed
::desigining::designing
::desireable::desirable
::desktiop::desktop
::dispair::despair
::desparate::desperate
::despiration::desperation
::dispicable::despicable
::dispite::despite
::destablised::destabilised
::destablized::destabilized
::desinations::destinations
::desitned::destined
::destory::destroy
::desctruction::destruction
::distruction::destruction
::distructive::destructive
::detatched::detached
::detailled::detailed
::deatils::details
::dectect::detect
::deteriate::deteriorate
::deteoriated::deteriorated
::deterioriating::deteriorating
::determinining::determining
::detremental::detrimental
::devasted::devastated
::devestated::devastated
::devestating::devastating
::devistating::devastating
::devellop::develop
::devellops::develop
::develloped::developed
::developped::developed
::develloper::developer
::developor::developer
::develeoprs::developers
::devellopers::developers
::developors::developers
::develloping::developing
::delevopment::development
::devellopment::development
::develpment::development
::devolopement::development
::devellopments::developments
::divice::device
::diablical::diabolical
::diamons::diamonds
::diarhea::diarrhoea
::dichtomy::dichotomy
::didnot::did not
::didint::didn't
::didnt::didn't
::differance::difference
::diferences::differences
::differances::differences
::difefrent::different
::diferent::different
::diferrent::different
::differant::different
::differemt::different
::differnt::different
::diffrent::different
::differentiatiations::differentiations
::diffcult::difficult
::diffculties::difficulties
::dificulties::difficulties
::diffculty::difficulty
::difficulity::difficulty
::dificulty::difficulty
::delapidated::dilapidated
::dimention::dimension
::dimentional::dimensional
::dimesnional::dimensional
::dimenions::dimensions
::dimentions::dimensions
::diminuitive::diminutive
::diosese::diocese
::diptheria::diphtheria
::diphtong::diphthong
::dipthong::diphthong
::diphtongs::diphthongs
::dipthongs::diphthongs
::diplomancy::diplomacy
::directiosn::direction
::driectly::directly
::directer::director
::directers::directors
::disagreeed::disagreed
::dissagreement::disagreement
::disapear::disappear
::dissapear::disappear
::dissappear::disappear
::dissapearance::disappearance
::disapeared::disappeared
::disappearred::disappeared
::dissapeared::disappeared
::dissapearing::disappearing
::dissapears::disappears
::dissappears::disappears
::dissappointed::disappointed
::disapointing::disappointing
::disaproval::disapproval
::dissarray::disarray
::diaster::disaster
::disasterous::disastrous
::disatrous::disastrous
::diciplin::discipline
::disiplined::disciplined
::unconfortability::discomfort
::diconnects::disconnects
::discontentment::discontent
::dicover::discover
::disover::discover
::dicovered::discovered
::discoverd::discovered
::dicovering::discovering
::dicovers::discovers
::dicovery::discovery
::descuss::discuss
::dicussed::discussed
::desease::disease
::disenchanged::disenchanted
::desintegrated::disintegrated
::desintegration::disintegration
::disobediance::disobedience
::dissobediance::disobedience
::dissobedience::disobedience
::disobediant::disobedient
::dissobediant::disobedient
::dissobedient::disobedient
::desorder::disorder
::desoriented::disoriented
::disparingly::disparagingly
::despatched::dispatched
::dispell::dispel
::dispeled::dispelled
::dispeling::dispelling
::dispells::dispels
::dispence::dispense
::dispenced::dispensed
::dispencing::dispensing
::diaplay::display
::dispaly::display
::unplease::displease
::dispostion::disposition
::disproportiate::disproportionate
::disputandem::disputandum
::disatisfaction::dissatisfaction
::disatisfied::dissatisfied
::disemination::dissemination
::disolved::dissolved
::dissonent::dissonant
::disctinction::distinction
::distiction::distinction
::disctinctive::distinctive
::distingish::distinguish
::distingished::distinguished
::distingquished::distinguished
::distingishes::distinguishes
::distingishing::distinguishing
::ditributed::distributed
::distribusion::distribution
::distrubution::distribution
::disricts::districts
::devide::divide
::devided::divided
::divison::division
::divisons::divisions
::docrines::doctrines
::doctines::doctrines
::doccument::document
::docuemnt::document
::documetn::document
::documnet::document
::documenatry::documentary
::doccumented::documented
::doccuments::documents
::docuement::documents
::documnets::documents
::doens::does
::doese::does
::doe snot::does not ; *could* be legitimate... but very unlikely!
::doens't::doesn't
::doesnt::doesn't
::dosen't::doesn't
::dosn't::doesn't
::doign::doing
::doimg::doing
::doind::doing
::donig::doing
::dollers::dollars
::dominent::dominant
::dominiant::dominant
::dominaton::domination
::do'nt::don't
::dont::don't
::don't no::don't know
::doulbe::double
::dowloads::downloads
::dramtic::dramatic
::draughtman::draughtsman
::dravadian::Dravidian
::deram::dream
::derams::dreams
::dreasm::dreams
::drnik::drink
::driveing::driving
::drummless::drumless
::druming::drumming
::drunkeness::drunkenness
::dukeship::dukedom
::dumbell::dumbbell
::dupicate::duplicate
::durig::during
::durring::during
::duting::during
::dieing::dying
::eahc::each
::eachotehr::eachother
::ealier::earlier
::earlies::earliest
::eearly::early
::earnt::earned
::ecclectic::eclectic
::eclispe::eclipse
::ecomonic::economic
::eceonomy::economy
::esctasy::ecstasy
::eles::eels
::effeciency::efficiency
::efficency::efficiency
::effecient::efficient
::efficent::efficient
::effeciently::efficiently
::efficently::efficiently
::effulence::effluence
::efort::effort
::eforts::efforts
::aggregious::egregious
::eight o::eight o
::eigth::eighth
::eiter::either
::ellected::elected
::electrial::electrical
::electricly::electrically
::electricty::electricity
::eletricity::electricity
::elementay::elementary
::elimentary::elementary
::elphant::elephant
::elicided::elicited
::eligable::eligible
::eleminated::eliminated
::eleminating::eliminating
::alse::else
::esle::else
::eminate::emanate
::eminated::emanated
::embargos::embargoes
::embarras::embarrass
::embarrased::embarrassed
::embarrasing::embarrassing
::embarrasment::embarrassment
::embezelled::embezzled
::emblamatic::emblematic
::emmigrated::emigrated
::emmisaries::emissaries
::emmisarries::emissaries
::emmisarry::emissary
::emmisary::emissary
::emision::emission
::emmision::emission
::emmisions::emissions
::emited::emitted
::emmited::emitted
::emmitted::emitted
::emiting::emitting
::emmiting::emitting
::emmitting::emitting
::emphsis::emphasis
::emphaised::emphasised
::emphysyma::emphysema
::emperical::empirical
::imploys::employs
::enameld::enamelled
::encouraing::encouraging
::encryptiion::encryption
::encylopedia::encyclopedia
::endevors::endeavors
::endevour::endeavour
::endevours::endeavours
::endig::ending
::endolithes::endoliths
::enforceing::enforcing
::engagment::engagement
::engeneer::engineer
::engieneer::engineer
::engeneering::engineering
::engieneers::engineers
::enlish::English
::enchancement::enhancement
::emnity::enmity
::enourmous::enormous
::enourmously::enormously
::enought::enough
::ensconsed::ensconced
::entaglements::entanglements
::intertaining::entertaining
::enteratinment::entertainment
::entitlied::entitled
::entitity::entity
::entrepeneur::entrepreneur
::entrepeneurs::entrepreneurs
::intrusted::entrusted
::enviornment::environment
::enviornmental::environmental
::enviornmentalist::environmentalist
::enviornmentally::environmentally
::enviornments::environments
::envrionments::environments
::epsiode::episode
::epidsodes::episodes
::equitorial::equatorial
::equilibium::equilibrium
::equilibrum::equilibrium
::equippment::equipment
::equiped::equipped
::equialent::equivalent
::equivalant::equivalent
::equivelant::equivalent
::equivelent::equivalent
::equivilant::equivalent
::equivilent::equivalent
::equivlalent::equivalent
::eratic::erratic
::eratically::erratically
::eraticly::erratically
::errupted::erupted
::especally::especially
::especialy::especially
::especialyl::especially
::espesially::especially
::expecially::especially
::expresso::espresso
::essense::essence
::esential::essential
::essencial::essential
::essentail::essential
::essentual::essential
::essesital::essential
::essentialy::essentially
::estabishes::establishes
::establising::establishing
::esitmated::estimated
::ect::etc
::ethnocentricm::ethnocentrism
::europian::European
::eurpean::European
::eurpoean::European
::europians::Europeans
::evenhtually::eventually
::eventally::eventually
::eventially::eventually
::eventualy::eventually
::eveyr::every
::everytime::every time
::everthing::everything
::evidentally::evidently
::efel::evil
::envolutionary::evolutionary
::exerbate::exacerbate
::exerbated::exacerbated
::excact::exact
::exagerate::exaggerate
::exagerrate::exaggerate
::exagerated::exaggerated
::exagerrated::exaggerated
::exagerates::exaggerates
::exagerrates::exaggerates
::exagerating::exaggerating
::exagerrating::exaggerating
::exhalted::exalted
::examinated::examined
::exemple::example
::exmaple::example
::excedded::exceeded
::exeedingly::exceedingly
::excell::excel
::excellance::excellence
::excelent::excellent
::excellant::excellent
::exelent::excellent
::exellent::excellent
::excells::excels
::exept::except
::exeptional::exceptional
::exerpt::excerpt
::exerpts::excerpts
::excange::exchange
::exchagne::exchange
::exhcange::exchange
::exchagnes::exchanges
::exhcanges::exchanges
::exchanching::exchanging
::excitment::excitement
::exicting::exciting
::exludes::excludes
::exculsivly::exclusively
::excecute::execute
::excecuted::executed
::exectued::executed
::excecutes::executes
::excecuting::executing
::excecution::execution
::exection::execution
::exampt::exempt
::excercise::exercise
::exersize::exercise
::exerciese::exercises
::execising::exercising
::extered::exerted
::exhibtion::exhibition
::exibition::exhibition
::exibitions::exhibitions
::exliled::exiled
::excisted::existed
::existance::existence
::existince::existence
::existant::existent
::exisiting::existing
::exonorate::exonerate
::exoskelaton::exoskeleton
::exapansion::expansion
::expeced::expected
::expeditonary::expeditionary
::expiditions::expeditions
::expell::expel
::expells::expels
::experiance::experience
::experienc::experience
::expierence::experience
::exprience::experience
::experianced::experienced
::exprienced::experienced
::expeiments::experiments
::expalin::explain
::explaning::explaining
::explaination::explanation
::explictly::explicitly
::explotation::exploitation
::exploititive::exploitative
::exressed::expressed
::expropiated::expropriated
::expropiation::expropriation
::extention::extension
::extentions::extensions
::exerternal::external
::exinct::extinct
::extradiction::extradition
::extrordinarily::extraordinarily
::extrordinary::extraordinary
::extravagent::extravagant
::extemely::extremely
::extrememly::extremely
::extremly::extremely
::extermist::extremist
::extremeophile::extremophile
::fascitious::facetious
::facillitate::facilitate
::facilites::facilities
::farenheit::Fahrenheit
::familair::familiar
::familar::familiar
::familliar::familiar
::fammiliar::familiar
::familes::families
::fimilies::families
::famoust::famous
::fanatism::fanaticism
::facia::fascia
::fascitis::fasciitis
::facinated::fascinated
::facist::fascist
::favoutrable::favourable
::feasable::feasible
::faeture::feature
::faetures::features
::febuary::February
::fedreally::federally
::efel::feel
::fertily::fertility
::fued::feud
::fwe::few
::ficticious::fictitious
::fictious::fictitious
::feild::field
::feilds::fields
::fiercly::fiercely
::firey::fiery
::fightings::fighting
::filiament::filament
::fiel::file
::fiels::files
::fianlly::finally
::finaly::finally
::finalyl::finally
::finacial::financial
::financialy::financially
::fidn::find
::fianite::finite
::firts::first
::fisionable::fissionable
::ficed::fixed
::flamable::flammable
::flawess::flawless
::flemmish::Flemish
::glight::flight
::fluorish::flourish
::florescent::fluorescent
::flourescent::fluorescent
::flouride::fluoride
::foucs::focus
::focussed::focused
::focusses::focuses
::focussing::focusing
::follwo::follow
::follwoing::following
::folowing::following
::formalhaut::Fomalhaut
::foootball::football
::fora::for a
::forthe::for the
::forbad::forbade
::forbiden::forbidden
::forhead::forehead
::foriegn::foreign
::formost::foremost
::forunner::forerunner
::forsaw::foresaw
::forseeable::foreseeable
::fortelling::foretelling
::foreward::foreword
::forfiet::forfeit
::formallise::formalise
::formallised::formalised
::formallize::formalize
::formallized::formalized
::formaly::formally
::fomed::formed
::fromed::formed
::formelly::formerly
::fourties::forties
::fourty::forty
::forwrd::forward
::foward::forward
::forwrds::forwards
::fowards::forwards
::faught::fought
::fougth::fought
::foudn::found
::foundaries::foundries
::foundary::foundry
::fouth::fourth
::fransiscan::Franciscan
::fransiscans::Franciscans
::frequentily::frequently
::freind::friend
::freindly::friendly
::firends::friends
::freinds::friends
::frmo::from
::frome::from
::fromt he::from the
::fromthe::from the
::froniter::frontier
::fufill::fulfill
::fufilled::fulfilled
::fulfiled::fulfilled
::funtion::function
::fundametal::fundamental
::fundametals::fundamentals
::furneral::funeral
::funguses::fungi
::firc::furc
::furuther::further
::futher::further
::futhermore::furthermore
::galatic::galactic
::galations::Galatians
::gallaxies::galaxies
::galvinised::galvanised
::galvinized::galvanized
::gameboy::Game Boy
::ganes::games
::ghandi::Gandhi
::ganster::gangster
::garnison::garrison
::guage::gauge
::geneological::genealogical
::geneologies::genealogies
::geneology::genealogy
::gemeral::general
::generaly::generally
::generatting::generating
::genialia::genitalia
::gentlemens::gentlemen's
::geographicial::geographical
::geometrician::geometer
::geometricians::geometers
::geting::getting
::gettin::getting
::guilia::Giulia
::guiliani::Giuliani
::guilio::Giulio
::guiseppe::Giuseppe
::gievn::given
::giveing::giving
::glace::glance
::gloabl::global
::gnawwed::gnawed
::godess::goddess
::godesses::goddesses
::godounov::Godunov
::goign::going
::gonig::going
::oging::going
::giid::good
::gothenberg::Gothenburg
::gottleib::Gottlieb
::goverance::governance
::govement::government
::govenment::government
::govenrment::government
::goverment::government
::governmnet::government
::govorment::government
::govornment::government
::govermental::governmental
::govormental::governmental
::gouvener::governor
::governer::governor
::gracefull::graceful
::graffitti::graffiti
::grafitti::graffiti
::grammer::grammar
::gramatically::grammatically
::grammaticaly::grammatically
::greatful::grateful
::greatfully::gratefully
::gratuitious::gratuitous
::gerat::great
::graet::great
::grat::great
::gridles::griddles
::greif::grief
::gropu::group
::gruop::group
::gruops::groups
::grwo::grow
::guadulupe::Guadalupe
::gunanine::guanine
::gauarana::guarana
::gaurantee::guarantee
::gaurentee::guarantee
::guarentee::guarantee
::gurantee::guarantee
::gauranteed::guaranteed
::gaurenteed::guaranteed
::guarenteed::guaranteed
::guranteed::guaranteed
::gaurantees::guarantees
::gaurentees::guarantees
::guarentees::guarantees
::gurantees::guarantees
::gaurd::guard
::guatamala::Guatemala
::guatamalan::Guatemalan
::guidence::guidance
::guiness::Guinness
::guttaral::guttural
::gutteral::guttural
::gusy::guys
::habaeus::habeas
::habeus::habeas
::habsbourg::Habsburg
::hda::had
::hadbeen::had been
::haemorrage::haemorrhage
::hallowean::Halloween
::ahppen::happen
::hapen::happen
::hapened::happened
::happend::happened
::happended::happened
::happenned::happened
::hapening::happening
::hapens::happens
::harras::harass
::harased::harassed
::harrased::harassed
::harrassed::harassed
::harrasses::harassed
::harases::harasses
::harrases::harasses
::harrasing::harassing
::harrassing::harassing
::harassement::harassment
::harrasment::harassment
::harrassment::harassment
::harrasments::harassments
::harrassments::harassments
::hace::hare
::hsa::has
::hasbeen::has been
::hasnt::hasn't
::ahev::have
::ahve::have
::haev::have
::hvae::have
::havebeen::have been
::haveing::having
::hvaing::having
::hge::he
::hesaid::he said
::hewas::he was
::headquater::headquarter
::headquatered::headquartered
::headquaters::headquarters
::healthercare::healthcare
::heathy::healthy
::heared::heard
::hearign::hearing
::herat::heart
::haviest::heaviest
::heidelburg::Heidelberg
::hieght::height
::hier::heir
::heirarchy::heirarchy
::helment::helmet
::halp::help
::hlep::help
::helpped::helped
::helpfull::helpful
::hemmorhage::hemorrhage
::ehre::here
::here;s::here's
::heridity::heredity
::heroe::hero
::heros::heroes
::hertzs::hertz
::hesistant::hesitant
::heterogenous::heterogeneous
::heirarchical::hierarchical
::hierachical::hierarchical
::hierarcical::hierarchical
::heirarchies::hierarchies
::hierachies::hierarchies
::heirarchy::hierarchy
::hierachy::hierarchy
::hierarcy::hierarchy
::hieroglph::hieroglyph
::heiroglyphics::hieroglyphics
::hieroglphs::hieroglyphs
::heigher::higher
::higer::higher
::higest::highest
::higway::highway
::hillarious::hilarious
::himselv::himself
::hismelf::himself
::hinderance::hindrance
::hinderence::hindrance
::hindrence::hindrance
::hipopotamus::hippopotamus
::hersuit::hirsute
::hsi::his
::ihs::his
::historicians::historians
::hsitorians::historians
::hstory::history
::hitsingles::hit singles
::hosited::hoisted
::holliday::holiday
::homestate::home state
::homogeneize::homogenize
::homogeneized::homogenized
::honourarium::honorarium
::honory::honorary
::honourific::honorific
::hounour::honour
::horrifing::horrifying
::hospitible::hospitable
::housr::hours
::howver::however
::huminoid::humanoid
::humoural::humoral
::humer::humour
::humerous::humourous
::humurous::humourous
::husban::husband
::hydogen::hydrogen
::hydropile::hydrophile
::hydropilic::hydrophilic
::hydropobe::hydrophobe
::hydropobic::hydrophobic
::hygeine::hygiene
::hypocracy::hypocrisy
::hypocrasy::hypocrisy
::hypocricy::hypocrisy
::hypocrit::hypocrite
::hypocrits::hypocrites
::i;d::I'd
::i"m::I'm
::iconclastic::iconoclastic
::idae::idea
::idaeidae::idea
::idaes::ideas
::identicial::identical
::identifers::identifiers
::identofy::identify
::idealogies::ideologies
::idealogy::ideology
::idiosyncracy::idiosyncrasy
::ideosyncratic::idiosyncratic
::ignorence::ignorance
::illiegal::illegal
::illegimacy::illegitimacy
::illegitmate::illegitimate
::illess::illness
::ilness::illness
::ilogical::illogical
::ilumination::illumination
::illution::illusion
::imagenary::imaginary
::imagin::imagine
::inbalance::imbalance
::inbalanced::imbalanced
::imediate::immediate
::emmediately::immediately
::imediately::immediately
::imediatly::immediately
::immediatley::immediately
::immediatly::immediately
::immidately::immediately
::immidiately::immediately
::imense::immense
::inmigrant::immigrant
::inmigrants::immigrants
::imanent::imminent
::immunosupressant::immunosuppressant
::inpeach::impeach
::impecabbly::impeccably
::impedence::impedance
::implamenting::implementing
::inpolite::impolite
::importamt::important
::importent::important
::importnat::important
::impossable::impossible
::emprisoned::imprisoned
::imprioned::imprisoned
::imprisonned::imprisoned
::inprisonment::imprisonment
::improvemnt::improvement
::improvment::improvement
::improvments::improvements
::inproving::improving
::improvision::improvisation
::int he::in the
::inteh::in the
::inthe::in the
::inwhich::in which
::inablility::inability
::inaccessable::inaccessible
::inadiquate::inadequate
::inadquate::inadequate
::inadvertant::inadvertent
::inadvertantly::inadvertently
::inappropiate::inappropriate
::inagurated::inaugurated
::inaugures::inaugurates
::inaguration::inauguration
::incarcirated::incarcerated
::incidentially::incidentally
::incidently::incidentally
::includ::include
::includng::including
::incuding::including
::incomptable::incompatible
::incompetance::incompetence
::incompetant::incompetent
::incomptetent::incompetent
::imcomplete::incomplete
::inconsistant::inconsistent
::incorportaed::incorporated
::incorprates::incorporates
::incorperation::incorporation
::incorruptable::incorruptible
::inclreased::increased
::increadible::incredible
::incredable::incredible
::incramentally::incrementally
::incunabla::incunabula
::indefinately::indefinitely
::indefinitly::indefinitely
::indepedence::independence
::independance::independence
::independece::independence
::indipendence::independence
::indepedent::independent
::independant::independent
::independendet::independent
::indipendent::independent
::indpendent::independent
::indepedantly::independently
::independantly::independently
::indipendently::independently
::indpendently::independently
::indecate::indicate
::indite::indict
::indictement::indictment
::indigineous::indigenous
::indispensible::indispensable
::individualy::individually
::indviduals::individuals
::enduce::induce
::indulgue::indulge
::indutrial::industrial
::inudstry::industry
::inefficienty::inefficiently
::unequalities::inequalities
::inevatible::inevitable
::inevitible::inevitable
::inevititably::inevitably
::infalability::infallibility
::infallable::infallible
::infrantryman::infantryman
::infectuous::infectious
::infered::inferred
::infilitrate::infiltrate
::infilitrated::infiltrated
::infilitration::infiltration
::infinit::infinite
::infinitly::infinitely
::enflamed::inflamed
::inflamation::inflammation
::influance::influence
::influented::influenced
::influencial::influential
::infomation::information
::informatoin::information
::informtion::information
::infrigement::infringement
::ingenius::ingenious
::ingreediants::ingredients
::inhabitans::inhabitants
::inherantly::inherently
::inheritence::inheritance
::inital::initial
::intial::initial
::ititial::initial
::initally::initially
::intially::initially
::initation::initiation
::initiaitive::initiative
::inate::innate
::inocence::innocence
::inumerable::innumerable
::innoculate::inoculate
::innoculated::inoculated
::insectiverous::insectivorous
::insensative::insensitive
::inseperable::inseparable
::insistance::insistence
::instaleld::installed
::instatance::instance
::instade::instead
::insted::instead
::institue::institute
::instutionalized::institutionalized
::instuction::instruction
::instuments::instruments
::insufficent::insufficient
::insufficently::insufficiently
::insurence::insurance
::intergrated::integrated
::intergration::integration
::intelectual::intellectual
::inteligence::intelligence
::inteligent::intelligent
::interchangable::interchangeable
::interchangably::interchangeably
::intercontinetal::intercontinental
::intrest::interest
::itnerest::interest
::itnerested::interested
::itneresting::interesting
::itnerests::interests
::interferance::interference
::interfereing::interfering
::interm::interim
::interrim::interim
::interum::interim
::intenational::international
::interational::international
::internation::international
::interpet::interpret
::intepretation::interpretation
::intepretator::interpretor
::interrugum::interregnum
::interelated::interrelated
::interupt::interrupt
::intevene::intervene
::intervines::intervenes
::inot::into
::inctroduce::introduce
::inctroduced::introduced
::intrduced::introduced
::introdued::introduced
::intruduced::introduced
::itnroduced::introduced
::instutions::intuitions
::intutive::intuitive
::intutively::intuitively
::inventer::inventor
::invertibrates::invertebrates
::investingate::investigate
::involvment::involvement
::ironicly::ironically
::irelevent::irrelevant
::irrelevent::irrelevant
::irreplacable::irreplaceable
::iresistable::irresistible
::iresistible::irresistible
::irresistable::irresistible
::iresistably::irresistibly
::iresistibly::irresistibly
::irresistably::irresistibly
::iritable::irritable
::iritated::irritated
::i snot::is not
::isthe::is the
::isnt::isn't
::issueing::issuing
::itis::it is
::itwas::it was
::it;s::it's
::its a::it's a
::it snot::it's not
::it' snot::it's not
::iits the::it's the
::its the::it's the
::ihaca::Ithaca
::jaques::jacques
::japanes::Japanese
::jeapardy::jeopardy
::jewelery::jewellery
::jewllery::jewellery
::johanine::Johannine
::jospeh::Joseph
::jouney::journey
::journied::journeyed
::journies::journeys
::juadaism::Judaism
::juadism::Judaism
::judgment::judgement
::jugment::judgment
::judical::judicial
::juducial::judicial
::judisuary::judiciary
::iunior::junior
::juristiction::jurisdiction
::juristictions::jurisdictions
::jstu::just
::jsut::just
::kindergarden::kindergarten
::klenex::kleenex
::knive::knife
::knifes::knives
::konw::know
::kwno::know
::nkow::know
::nkwo::know
::knowldge::knowledge
::knowlege::knowledge
::knowlegeable::knowledgeable
::knwon::known
::konws::knows
::labled::labelled
::labratory::laboratory
::labourious::laborious
::layed::laid
::laguage::language
::laguages::languages
::larg::large
::largst::largest
::larrry::larry
::lavae::larvae
::lazer::laser
::lasoo::lasso
::lastr::last
::lsat::last
::lastyear::last year
::lastest::latest
::lattitude::latitude
::launchs::launch
::launhed::launched
::lazyness::laziness
::leage::league
::leran::learn
::learnign::learning
::lerans::learns
::elast::least
::leaded::led
::lefted::left
::legitamate::legitimate
::legitmate::legitimate
::leibnitz::leibniz
::liesure::leisure
::lenght::length
::let;s::let's
::leathal::lethal
::let's him::lets him
::let's it::lets it
::levle::level
::levetate::levitate
::levetated::levitated
::levetates::levitates
::levetating::levitating
::liasion::liaison
::liason::liaison
::liasons::liaisons
::libell::libel
::libitarianisn::libertarianism
::libary::library
::librarry::library
::librery::library
::lybia::Libya
::lisense::license
::leutenant::lieutenant
::lieutenent::lieutenant
::liftime::lifetime
::lightyear::light year
::lightyears::light years
::lightening::lightning
::liek::like
::liuke::like
::liekd::liked
::likelyhood::likelihood
::likly::likely
::lukid::likud
::lmits::limits
::libguistic::linguistic
::libguistics::linguistics
::linnaena::linnaean
::lippizaner::lipizzaner
::liquify::liquefy
::listners::listeners
::litterally::literally
::litature::literature
::literture::literature
::littel::little
::litttle::little
::liev::live
::lieved::lived
::livley::lively
::liveing::living
::lonelyness::loneliness
::lonley::lonely
::lonly::lonely
::longitudonal::longitudinal
::lookign::looking
::loosing::losing
::lotharingen::lothringen
::loev::love
::lveo::love
::lvoe::love
::lieing::lying
::mackeral::mackerel
::amde::made
::magasine::magazine
::magincian::magician
::magnificient::magnificent
::magolia::magnolia
::mailny::mainly
::mantain::maintain
::mantained::maintained
::maintinaing::maintaining
::maintainance::maintenance
::maintainence::maintenance
::maintance::maintenance
::maintenence::maintenance
::majoroty::majority
::marjority::majority
::amke::make
::mkae::make
::mkea::make
::amkes::makes
::makse::makes
::mkaes::makes
::amking::making
::makeing::making
::mkaing::making
::malcom::Malcolm
::maltesian::Maltese
::mamal::mammal
::mamalian::mammalian
::managable::manageable
::managment::management
::manuver::maneuver
::manoeuverability::maneuverability
::manifestion::manifestation
::manisfestations::manifestations
::manufature::manufacture
::manufacturedd::manufactured
::manufatured::manufactured
::manufaturing::manufacturing
::mrak::mark
::maked::marked
::marketting::marketing
::markes::marks
::marmelade::marmalade
::mariage::marriage
::marrage::marriage
::marraige::marriage
::marryied::married
::marrtyred::martyred
::massmedia::mass media
::massachussets::Massachusetts
::massachussetts::Massachusetts
::masterbation::masturbation
::materalists::materialist
::mathmatically::mathematically
::mathematican::mathematician
::mathmatician::mathematician
::matheticians::mathematicians
::mathmaticians::mathematicians
::mathamatics::mathematics
::mathematicas::mathematics
::may of::may have
::mccarthyst::mccarthyist
::meaninng::meaning
::menat::meant
::mchanics::mechanics
::medieval::mediaeval
::medacine::medicine
::mediciney::mediciny
::medeival::medieval
::medevial::medieval
::medievel::medieval
::mediterainnean::mediterranean
::mediteranean::Mediterranean
::meerkrat::meerkat
::memeber::member
::membranaphone::membranophone
::momento::memento
::rememberable::memorable
::menally::mentally
::maintioned::mentioned
::mercentile::mercantile
::mechandise::merchandise
::merchent::merchant
::mesage::message
::mesages::messages
::messenging::messaging
::messanger::messenger
::metalic::metallic
::metalurgic::metallurgic
::metalurgical::metallurgical
::metalurgy::metallurgy
::metamorphysis::metamorphosis
::methaphor::metaphor
::metaphoricial::metaphorical
::methaphors::metaphors
::mataphysical::metaphysical
::meterologist::meteorologist
::meterology::meteorology
::micheal::Michael
::michagan::Michigan
::micoscopy::microscopy
::midwifes::midwives
::might of::might have
::mileau::milieu
::mileu::milieu
::melieux::milieux
::miliary::military
::miliraty::military
::millitary::military
::miltary::military
::milennia::millennia
::millenia::millennia
::millenial::millennial
::millenialism::millennialism
::milennium::millennium
::millenium::millennium
::milion::million
::millon::million
::millioniare::millionaire
::millepede::millipede
::minerial::mineral
::minature::miniature
::minumum::minimum
::minstries::ministries
::ministery::ministry
::minstry::ministry
::miniscule::minuscule
::mirrorred::mirrored
::miscelaneous::miscellaneous
::miscellanious::miscellaneous
::miscellanous::miscellaneous
::mischeivous::mischievous
::mischevious::mischievous
::mischievious::mischievous
::misdameanor::misdemeanor
::misdemenor::misdemeanor
::misdameanors::misdemeanors
::misdemenors::misdemeanors
::misfourtunes::misfortunes
::mysogynist::misogynist
::mysogyny::misogyny
::misile::missile
::missle::missile
::missonary::missionary
::missisipi::Mississippi
::missisippi::Mississippi
::misouri::Missouri
::mispell::misspell
::mispelled::misspelled
::mispelling::misspelling
::mispellings::misspellings
::mythraic::Mithraic
::missen::mizzen
::modle::model
::moderm::modem
::moil::mohel
::mosture::moisture
::moleclues::molecules
::moent::moment
::monestaries::monasteries
::monestary::monastery
::moeny::money
::monickers::monikers
::monkies::monkeys
::monolite::monolithic
::montypic::monotypic
::mounth::month
::monts::months
::monserrat::Montserrat
::mroe::more
::omre::more
::moreso::more so
::morisette::Morissette
::morrisette::Morissette
::morroccan::moroccan
::morrocco::morocco
::morroco::morocco
::morgage::mortgage
::motiviated::motivated
::mottos::mottoes
::montanous::mountainous
::montains::mountains
::movment::movement
::movei::movie
::mucuous::mucous
::multicultralism::multiculturalism
::multipled::multiplied
::multiplers::multipliers
::muncipalities::municipalities
::muncipality::municipality
::munnicipality::municipality
::muder::murder
::mudering::murdering
::muscial::musical
::muscician::musician
::muscicians::musicians
::muhammadan::muslim
::mohammedans::muslims
::must of::must have
::mutiliated::mutilated
::myu::my
::myraid::myriad
::mysef::myself
::mysefl::myself
::misterious::mysterious
::misteryous::mysterious
::mysterous::mysterious
::mistery::mystery
::naieve::naive
::napoleonian::Napoleonic
::ansalisation::nasalisation
::ansalization::nasalization
::naturual::natural
::naturaly::naturally
::naturely::naturally
::naturually::naturally
::nazereth::Nazareth
::neccesarily::necessarily
::neccessarily::necessarily
::necesarily::necessarily
::nessasarily::necessarily
::neccesary::necessary
::neccessary::necessary
::necesary::necessary
::nessecary::necessary
::necessiate::necessitate
::neccessities::necessities
::ened::need
::neglible::negligible
::negligable::negligible
::negociable::negotiable
::negotiaing::negotiating
::negotation::negotiation
::neigbourhood::neighbourhood
::neolitic::neolithic
::nestin::nesting
::nver::never
::neverthless::nevertheless
::nwe::new
::newyorker::New Yorker
::foundland::Newfoundland
::newletters::newsletters
::enxt::next
::nickle::nickel
::neice::niece
::nightime::nighttime
::ninteenth::nineteenth
::ninties::nineties ; fixed from "1990s": could refer to temperatures too.
::ninty::ninety
::nineth::ninth
::noone::no one
::noncombatents::noncombatants
::nontheless::nonetheless
::unoperational::nonoperational
::nonsence::nonsense
::noth::north
::northereastern::northeastern
::norhern::northern
::northen::northern
::nothern::northern
:C:Nto::Not
:C:nto::not
::noteable::notable
::notabley::notably
::noteably::notably
::nothign::nothing
::notive::notice
::noticable::noticeable
::noticably::noticeably
::noticeing::noticing
::noteriety::notoriety
::notwhithstanding::notwithstanding
::noveau::nouveau
::nowe::now
::nwo::now
::nowdays::nowadays
::nucular::nuclear
::nuculear::nuclear
::nuisanse::nuisance
::nusance::nuisance
::nullabour::Nullarbor
::munbers::numbers
::numberous::numerous
::nuptual::nuptial
::nuremburg::Nuremberg
::nuturing::nurturing
::nutritent::nutrient
::nutritents::nutrients
::obediance::obedience
::obediant::obedient
::obssessed::obsessed
::obession::obsession
::obsolecence::obsolescence
::obstacal::obstacle
::obstancles::obstacles
::obstruced::obstructed
::ocassion::occasion
::occaison::occasion
::occassion::occasion
::ocassional::occasional
::occassional::occasional
::ocassionally::occasionally
::ocassionaly::occasionally
::occassionally::occasionally
::occassionaly::occasionally
::occationally::occasionally
::ocassioned::occasioned
::occassioned::occasioned
::ocassions::occasions
::occassions::occasions
::occour::occur
::occurr::occur
::ocur::occur
::ocurr::occur
::occured::occurred
::ocurred::occurred
::occurence::occurrence
::occurrance::occurrence
::ocurrance::occurrence
::ocurrence::occurrence
::occurences::occurrences
::occurrances::occurrences
::occuring::occurring
::octohedra::octahedra
::octohedral::octahedral
::octohedron::octahedron
::odouriferous::odoriferous
::odourous::odorous
::ouevre::oeuvre
::fo::of
:C:fo::of
:C:od::of
::ofits::of its
::ofthe::of the
::oft he::of the ; Could be legitimate in poetry, but more usually a typo.
::offereings::offerings
::offcers::officers
::offical::official
::offcially::officially
::offically::officially
::officaly::officially
::officialy::officially
::oftenly::often
::omlette::omelette
::omnious::ominous
::omision::omission
::ommision::omission
::omited::omitted
::ommited::omitted
::ommitted::omitted
::omiting::omitting
::ommiting::omitting
::ommitting::omitting
::omniverous::omnivorous
::omniverously::omnivorously
::ont he::on the
::onthe::on the
::oneof::one of
::onepoint::one point
::onyl::only
::onomatopeia::onomatopoeia
::oppenly::openly
::openess::openness
::opperation::operation
::oeprator::operator
::opthalmic::ophthalmic
::opthalmologist::ophthalmologist
::opthamologist::ophthalmologist
::opthalmology::ophthalmology
::oppinion::opinion
::oponent::opponent
::opponant::opponent
::oppononent::opponent
::oppotunities::opportunities
::oportunity::opportunity
::oppertunity::opportunity
::oppotunity::opportunity
::opprotunity::opportunity
::opposible::opposable
::opose::oppose
::oppossed::opposed
::oposite::opposite
::oppasite::opposite
::opposate::opposite
::opposit::opposite
::oposition::opposition
::oppositition::opposition
::opression::oppression
::opressive::oppressive
::optomism::optimism
::optmizations::optimizations
::orded::ordered
::oridinarily::ordinarily
::orginize::organise
::organim::organism
::organiztion::organization
::orginization::organization
::orginized::organized
::orgin::origin
::orginal::original
::origional::original
::orginally::originally
::origanaly::originally
::originall::originally
::originaly::originally
::originially::originally
::originnally::originally
::orignally::originally
::orignially::originally
::orthagonal::orthogonal
::orthagonally::orthogonally
::ohter::other
::otehr::other
::otherw::others
::otu::out
::outof::out of
::overthe::over the
::overthere::over there
::overshaddowed::overshadowed
::overwelming::overwhelming
::overwheliming::overwhelming
::pwn::own
::oxident::oxidant
::oxigen::oxygen
::oximoron::oxymoron
::peageant::pageant
::paide::paid
::payed::paid
::paleolitic::paleolithic
::palistian::Palestinian
::palistinian::Palestinian
::palistinians::Palestinians
::pallete::palette
::pamflet::pamphlet
::pamplet::pamphlet
::pantomine::pantomime
::papanicalou::Papanicolaou
::papaer::paper
::perade::parade
::parrakeets::parakeets
::paralel::parallel
::paralell::parallel
::parralel::parallel
::parrallel::parallel
::parrallell::parallel
::paralelly::parallelly
::paralely::parallelly
::parallely::parallelly
::parrallelly::parallelly
::parrallely::parallelly
::parellels::parallels
::paraphenalia::paraphernalia
::paranthesis::parenthesis
::parliment::parliament
::paliamentarian::parliamentarian
::partof::part of
::partialy::partially
::parituclar::particular
::particualr::particular
::paticular::particular
::particuarly::particularly
::particularily::particularly
::particulary::particularly
::pary::party
::pased::passed
::pasengers::passengers
::passerbys::passersby
::pasttime::pastime
::pastural::pastoral
::pattented::patented
::paitience::patience
::pavillion::pavilion
::paymetn::payment
::paymetns::payments
::peacefuland::peaceful and
::peculure::peculiar
::pedestrain::pedestrian
::perjorative::pejorative
::peloponnes::Peloponnesus
::peleton::peloton
::penatly::penalty
::penerator::penetrator
::penisula::peninsula
::penninsula::peninsula
::pennisula::peninsula
::pensinula::peninsula
::penisular::peninsular
::penninsular::peninsular
::peolpe::people
::peopel::people
::poeple::people
::poeoples::peoples
::percieve::perceive
::percepted::perceived
::percieved::perceived
::percentof::percent of
::percentto::percent to
::precentage::percentage
::perenially::perennially
::performence::performance
::perfomers::performers
::performes::performs
::perhasp::perhaps
::perheaps::perhaps
::perhpas::perhaps
::perphas::perhaps
::preiod::period
::preriod::period
::peripathetic::peripatetic
::perjery::perjury
::permanant::permanent
::permenant::permanent
::perminent::permanent
::permenantly::permanently
::permissable::permissible
::premission::permission
::perpindicular::perpendicular
::perseverence::perseverance
::persistance::persistence
::peristent::persistent
::persistant::persistent
::peronal::personal
::perosnality::personality
::personalyl::personally
::personell::personnel
::personnell::personnel
::prespective::perspective
::pursuade::persuade
::persuded::persuaded
::pursuaded::persuaded
::pursuades::persuades
::pususading::persuading
::pertubation::perturbation
::pertubations::perturbations
::preverse::perverse
::pessiary::pessary
::petetion::petition
::pharoah::Pharaoh
::phenonmena::phenomena
::phenomenonal::phenomenal
::phenomenonly::phenomenally
::phenomenom::phenomenon
::phenomonenon::phenomenon
::phenomonon::phenomenon
::feromone::pheromone
::phillipine::Philippine
::philipines::Philippines
::phillipines::Philippines
::phillippines::Philippines
::philisopher::philosopher
::philospher::philosopher
::philisophical::philosophical
::phylosophical::philosophical
::phillosophically::philosophically
::philosphies::philosophies
::philisophy::philosophy
::philosphy::philosophy
::phonecian::Phoenecian
::pheonix::phoenix ; Not forcing caps, as it could be the bird
::fonetic::phonetic
::phongraph::phonograph
::physicaly::physically
::pciture::picture
::peice::piece
::peices::pieces
::pilgrimmage::pilgrimage
::pilgrimmages::pilgrimages
::pinapple::pineapple
::pinnaple::pineapple
::pinoneered::pioneered
::pich::pitch
::palce::place
::plagarism::plagiarism
::plantiff::plaintiff
::planed::planned
::planation::plantation
::plateu::plateau
::plausable::plausible
::playright::playwright
::playwrite::playwright
::playwrites::playwrights
::pleasent::pleasant
::plesant::pleasant
::plebicite::plebiscite
::peom::poem
::peoms::poems
::peotry::poetry
::poety::poetry
::poisin::poison
::posion::poison
::polical::political
::poltical::political
::politican::politician
::politicans::politicians
::polinator::pollinator
::polinators::pollinators
::polute::pollute
::poluted::polluted
::polutes::pollutes
::poluting::polluting
::polution::pollution
::polyphonyic::polyphonic
::polysaccaride::polysaccharide
::polysaccharid::polysaccharide
::pomegranite::pomegranate
::populare::popular
::popularaty::popularity
::popoulation::population
::poulations::populations
::portayed::portrayed
::potrayed::portrayed
::protrayed::portrayed
::portraing::portraying
::portugese::Portuguese
::portuguease::portuguese
::possition::position
::postion::position
::postition::position
::psoition::position
::postive::positive
::posess::possess
::posessed::possessed
::posesses::possesses
::posseses::possesses
::possessess::possesses
::posessing::possessing
::possesing::possessing
::posession::possession
::possesion::possession
::posessions::possessions
::possiblility::possibility
::possiblilty::possibility
::possable::possible
::possibile::possible
::possably::possibly
::posthomous::posthumous
::potatoe::potato
::potatos::potatoes
::potentialy::potentially
::postdam::Potsdam
::pwoer::power
::poverful::powerful
::poweful::powerful
::powerfull::powerful
::practial::practical
::practially::practically
::practicaly::practically
::practicly::practically
::pratice::practice
::practicioner::practitioner
::practioner::practitioner
::practicioners::practitioners
::practioners::practitioners
::prairy::prairie
::prarie::prairie
::praries::prairies
::pre-Colombian::pre-Columbian
::preample::preamble
::preceed::precede
::preceeded::preceded
::preceeds::precedes
::preceeding::preceding
::precice::precise
::precisly::precisely
::precurser::precursor
::precedessor::predecessor
::predecesors::predecessors
::predicatble::predictable
::predicitons::predictions
::predomiantly::predominately
::preminence::preeminence
::preferrably::preferably
::prefernece::preference
::preferneces::preferences
::prefered::preferred
::prefering::preferring
::pregancies::pregnancies
::pregnent::pregnant
::premeire::premiere
::premeired::premiered
::premillenial::premillennial
::premonasterians::Premonstratensians
::preocupation::preoccupation
::prepartion::preparation
::preperation::preparation
::preperations::preparations
::prepatory::preparatory
::prepair::prepare
::perogative::prerogative
::presance::presence
::presense::presence
::presedential::presidential
::presidenital::presidential
::presidental::presidential
::presitgious::prestigious
::prestigeous::prestigious
::prestigous::prestigious
::presumabely::presumably
::presumibly::presumably
::prevelant::prevalent
::previvous::previous
::priestood::priesthood
::primarly::primarily
::primative::primitive
::primatively::primitively
::primatives::primitives
::primordal::primordial
::pricipal::principal
::priciple::principle
::privte::private
::privelege::privilege
::privelige::privilege
::privilage::privilege
::priviledge::privilege
::privledge::privilege
::priveleged::privileged
::priveliged::privileged
::priveleges::privileges
::priveliges::privileges
::privelleges::privileges
::priviledges::privileges
::protem::pro tem
::probablistic::probabilistic
::probabilaty::probability
::probalibity::probability
::probablly::probably
::probaly::probably
::porblem::problem
::probelm::problem
::porblems::problems
::probelms::problems
::procedger::procedure
::proceedure::procedure
::procede::proceed
::proceded::proceeded
::proceding::proceeding
::procedings::proceedings
::procedes::proceeds
::proccess::process
::proces::process
::proccessing::processing
::processer::processor
::proclamed::proclaimed
::proclaming::proclaiming
::proclaimation::proclamation
::proclomation::proclamation
::proffesed::professed
::profesion::profession
::proffesion::profession
::proffesional::professional
::profesor::professor
::professer::professor
::proffesor::professor
::programable::programmable
::ptogress::progress
::progessed::progressed
::prohabition::prohibition
::prologomena::prolegomena
::preliferation::proliferation
::profilic::prolific
::prominance::prominence
::prominant::prominent
::prominantly::prominently
::promiscous::promiscuous
::promotted::promoted
::pomotion::promotion
::propmted::prompted
::pronomial::pronominal
::pronouced::pronounced
::pronounched::pronounced
::prouncements::pronouncements
::pronounciation::pronunciation
::propoganda::propaganda
::propogate::propagate
::propogates::propagates
::propogation::propagation
::propper::proper
::propperly::properly
::prophacy::prophecy
::poportional::proportional
::propotions::proportions
::propostion::proposition
::propietary::proprietary
::proprietory::proprietary
::proseletyzing::proselytizing
::protaganist::protagonist
::protoganist::protagonist
::protaganists::protagonists
::pretection::protection
::protien::protein
::protocal::protocol
::protruberance::protuberance
::protruberances::protuberances
::proove::prove
::prooved::proved
::porvide::provide
::provded::provided
::provicial::provincial
::provinicial::provincial
::provisonal::provisional
::provacative::provocative
::proximty::proximity
::psuedo::pseudo
::pseudonyn::pseudonym
::pseudononymous::pseudonymous
::psyhic::psychic
::pyscic::psychic
::psycology::psychology
::publically::publicly
::publicaly::publicly
::pucini::Puccini
::puertorrican::Puerto Rican
::puertorricans::Puerto Ricans
::pumkin::pumpkin
::puchasing::purchasing
::puritannical::puritanical
::purpotedly::purportedly
::purposedly::purposely
::persue::pursue
::persued::pursued
::persuing::pursuing
::persuit::pursuit
::persuits::pursuits
::puting::putting
::quantaty::quantity
::quantitiy::quantity
::quarantaine::quarantine
::quater::quarter
::quaters::quarters
::quesion::question
::questoin::question
::quetion::question
::questonable::questionable
::questionnair::questionnaire
::quesions::questions
::questioms::questions
::questiosn::questions
::quetions::questions
::quicklyu::quickly
::quinessential::quintessential
::quitted::quit
::quizes::quizzes
::rabinnical::rabbinical
::radiactive::radioactive
::rancourous::rancorous
::repid::rapid
::rarified::rarefied
::rasberry::raspberry
::ratehr::rather
::radify::ratify
::racaus::raucous
::reched::reached
::reacing::reaching
::readmition::readmission
::rela::real
::relized::realised
::realsitic::realistic
::erally::really
::raelly::really
::realy::really
::realyl::really
::relaly::really
::rebllions::rebellions
::rebounce::rebound
::rebiulding::rebuilding
::reacll::recall
::receeded::receded
::receeding::receding
::receieve::receive
::receivedfrom::received from
::receving::receiving
::rechargable::rechargeable
::recipiant::recipient
::reciepents::recipients
::recipiants::recipients
::recogise::recognise
::recogize::recognize
::reconize::recognize
::reconized::recognized
::reccommend::recommend
::recomend::recommend
::reommend::recommend
::recomendation::recommendation
::recomendations::recommendations
::recommedations::recommendations
::reccommended::recommended
::recomended::recommended
::reccommending::recommending
::recomending::recommending
::recomends::recommends
::reconcilation::reconciliation
::reconaissance::reconnaissance
::reconnaissence::reconnaissance
::recontructed::reconstructed
::recrod::record
::rocord::record
::recordproducer::record producer
::recrational::recreational
::recuiting::recruiting
::rucuperate::recuperate
::recurrance::recurrence
::reoccurrence::recurrence
::reaccurring::recurring
::reccuring::recurring
::recuring::recurring
::recyling::recycling
::reedeming::redeeming
::relected::reelected
::revaluated::reevaluated
::referrence::reference
::refference::reference
::refrence::reference
::refernces::references
::refrences::references
::refedendum::referendum
::referal::referral
::refered::referred
::reffered::referred
::referiang::referring
::refering::referring
::referrs::refers
::refrers::refers
::refect::reflect
::refromist::reformist
::refridgeration::refrigeration
::refridgerator::refrigerator
::refusla::refusal
::irregardless::regardless
::regardes::regards
::regluar::regular
::reguarly::regularly
::regularily::regularly
::regulaion::regulation
::regulaotrs::regulators
::rehersal::rehearsal
::reigining::reigning
::reicarnation::reincarnation
::reenforced::reinforced
::realtions::relations
::relatiopnship::relationship
::realitvely::relatively
::relativly::relatively
::relitavely::relatively
::releses::releases
::relevence::relevance
::relevent::relevant
::relient::reliant
::releive::relieve
::releived::relieved
::releiver::reliever
::religeous::religious
::religous::religious
::religously::religiously
::relinqushment::relinquishment
::reluctent::reluctant
::remaing::remaining
::remeber::remember
::rememberance::remembrance
::remembrence::remembrance
::remenicent::reminiscent
::reminescent::reminiscent
::reminscent::reminiscent
::reminsicent::reminiscent
::remenant::remnant
::reminent::remnant
::renedered::rende
::rendevous::rendezvous
::rendezous::rendezvous
::renewl::renewal
::reknown::renown
::reknowned::renowned
::rentors::renters
::reorganision::reorganisation
::repeteadly::repeatedly
::repentence::repentance
::repentent::repentant
::reprtoire::repertoire
::repetion::repetition
::reptition::repetition
::relpacement::replacement
::reportadly::reportedly
::represnt::represent
::represantative::representative
::representive::representative
::representativs::representatives
::representives::representatives
::represetned::represented
::reproducable::reproducible
::requred::required
::reasearch::research
::reserach::research
::resembelance::resemblance
::resemblence::resemblance
::ressemblance::resemblance
::ressemblence::resemblance
::ressemble::resemble
::ressembled::resembled
::resembes::resembles
::ressembling::resembling
::resevoir::reservoir
::recide::reside
::recided::resided
::recident::resident
::recidents::residents
::reciding::residing
::resignement::resignment
::resistence::resistance
::resistent::resistant
::resistable::resistible
::resollution::resolution
::resorces::resources
::repsectively::respectively
::respectivly::respectively
::respomse::response
::responce::response
::responibilities::responsibilities
::responsability::responsibility
::responisble::responsible
::responsable::responsible
::responsibile::responsible
::resaurant::restaurant
::restaraunt::restaurant
::restauraunt::restaurant
::resteraunt::restaurant
::restuarant::restaurant
::resturant::restaurant
::resturaunt::restaurant
::restaraunts::restaurants
::resteraunts::restaurants
::restaraunteur::restaurateur
::restaraunteurs::restaurateurs
::restauranteurs::restaurateurs
::restauration::restoration
::resticted::restricted
::reult::result
::resurgance::resurgence
::resssurecting::resurrecting
::resurecting::resurrecting
::ressurrection::resurrection
::retalitated::retaliated
::retalitation::retaliation
::retreive::retrieve
::returnd::returned
::reveral::reversal
::reversable::reversible
::reveiw::review
::reveiwing::reviewing
::revolutionar::revolutionary
::rewriet::rewrite
::rewitten::rewritten
::rhymme::rhyme
::rhythem::rhythm
::rhythim::rhythm
::rythem::rhythm
::rythim::rhythm
::rythm::rhythm
::rhytmic::rhythmic
::rythmic::rhythmic
::rythyms::rhythms
::rediculous::ridiculous
::rigourous::rigorous
::rigeur::rigueur
::rininging::ringing
::rockerfeller::Rockefeller
::rococco::rococo
::roomate::roommate
::rised::rose
::rougly::roughly
::rudimentatry::rudimentary
::rulle::rule
::rumers::rumors
::runing::running
::runnung::running
::russina::Russian
::russion::Russian
::sacrafice::sacrifice
::sacrifical::sacrificial
::sacreligious::sacrilegious
::sandess::sadness
::saftey::safety
::safty::safety
::saidhe::said he
::saidit::said it
::saidthat::said that
::saidt he::said the
::saidthe::said the
::salery::salary
::smae::same
::santioned::sanctioned
::sanctionning::sanctioning
::sandwhich::sandwich
::sanhedrim::Sanhedrin
::satelite::satellite
::sattelite::satellite
::satelites::satellites
::sattelites::satellites
::satric::satiric
::satrical::satirical
::satrically::satirically
::satisfactority::satisfactorily
::saterday::Saturday
::saterdays::Saturdays
::svae::save
::svaes::saves
::saxaphone::saxophone
::sasy::says
::syas::says
::scaleable::scalable
::scandanavia::Scandinavia
::scaricity::scarcity
::scavanged::scavenged
::senarios::scenarios
::scedule::schedule
::schedual::schedule
::sceduled::scheduled
::scholarhip::scholarship
::scholarstic::scholastic
::shcool::school
::scince::science
::scinece::science
::scientfic::scientific
::scientifc::scientific
::screenwrighter::screenwriter
::scirpt::script
::scoll::scroll
::scrutinity::scrutiny
::scuptures::sculptures
::seach::search
::seached::searched
::seaches::searches
::secratary::secretary
::secretery::secretary
::sectino::section
::seing::seeing
::segementation::segmentation
::seguoys::segues
::sieze::seize
::siezed::seized
::siezing::seizing
::siezure::seizure
::siezures::seizures
::seldomly::seldom
::selectoin::selection
::seinor::senior
::sence::sense
::senstive::sensitive
::sentance::sentence
::separeate::separate
::sepulchure::sepulchre
::sargant::sergeant
::sargeant::sergeant
::sergent::sergeant
::settelement::settlement
::settlment::settlement
::severeal::several
::severley::severely
::severly::severely
::shaddow::shadow
::seh::she
::shesaid::she said
::sherif::sheriff
::sheild::shield
::shineing::shining
::shiped::shipped
::shiping::shipping
::shopkeeepers::shopkeepers
::shortwhile::short while
::shorly::shortly
::shoudl::should
::should of::should have
::shoudln't::shouldn't
::shouldent::shouldn't
::shouldnt::shouldn't
::sohw::show
::showinf::showing
::shreak::shriek
::shrinked::shrunk
::sedereal::sidereal
::sideral::sidereal
::seige::siege
::signitories::signatories
::signitory::signatory
::siginificant::significant
::signficant::significant
::signficiant::significant
::signifacnt::significant
::signifigant::significant
::signifantly::significantly
::significently::significantly
::signifigantly::significantly
::signfies::signifies
::silicone chip::silicon chip
::simalar::similar
::similiar::similar
::simmilar::similar
::similiarity::similarity
::similarily::similarly
::similiarly::similarly
::simplier::simpler
::simpley::simply
::simpyl::simply
::simultanous::simultaneous
::simultanously::simultaneously
::sicne::since
::sincerley::sincerely
::sincerly::sincerely
::singsog::singsong
::sixtin::Sistine
::skagerak::Skagerrak
::skateing::skating
::slaugterhouses::slaughterhouses
::slowy::slowly
::smoothe::smooth
::smoothes::smooths
::sneeks::sneaks
::snese::sneeze
::sot hat::so that
::soical::social
::socalism::socialism
::socities::societies
::sofware::software
::soilders::soldiers
::soliders::soldiers
::soley::solely
::soliliquy::soliloquy
::solatary::solitary
::soluable::soluble
::soem::some
::somene::someone
::somethign::something
::someting::something
::somthing::something
::somtimes::sometimes
::somewaht::somewhat
::somwhere::somewhere
::sophicated::sophisticated
::suphisticated::sophisticated
::sophmore::sophomore
::sorceror::sorcerer
::saught::sought
::seeked::sought
::soudn::sound
::soudns::sounds
::sountrack::soundtrack
::suop::soup
::sourth::south
::sourthern::southern
::souvenier::souvenir
::souveniers::souvenirs
::soverign::sovereign
::sovereignity::sovereignty
::soverignity::sovereignty
::soverignty::sovereignty
::soveits::soviets
::soveits::soviets(x
::spoace::space
::spainish::Spanish
::speciallized::specialised
::speices::species
::specfic::specific
::specificaly::specifically
::specificalyl::specifically
::specifiying::specifying
::speciman::specimen
::spectauclar::spectacular
::spectaulars::spectaculars
::spectum::spectrum
::speach::speech
::sprech::speech
::sppeches::speeches
::spermatozoan::spermatozoon
::spriritual::spiritual
::spritual::spiritual
::spendour::splendour
::sponser::sponsor
::sponsered::sponsored
::sponzored::sponsored
::spontanous::spontaneous
::spoonfulls::spoonfuls
::sportscar::sports car
::spreaded::spread
::spred::spread
::sqaure::square
::stablility::stability
::stainlees::stainless
::stnad::stand
::standars::standards
::strat::start
::statment::statement
::statememts::statements
::statments::statements
::stateman::statesman
::staion::station
::sterotypes::stereotypes
::steriods::steroids
::sitll::still
::stiring::stirring
::stirrs::stirs
::stpo::stop
::storeis::stories
::storise::stories
::sotry::story
::stopry::story
::stoyr::story
::stroy::story
::strnad::strand
::stange::strange
::startegic::strategic
::stratagically::strategically
::startegies::strategies
::stradegies::strategies
::startegy::strategy
::stradegy::strategy
::streemlining::streamlining
::stregth::strength
::strenght::strength
::strentgh::strength
::strenghen::strengthen
::strenghten::strengthen
::strenghened::strengthened
::strenghtened::strengthened
::strengtened::strengthened
::strenghening::strengthening
::strenghtening::strengthening
::strenous::strenuous
::strictist::strictest
::strikely::strikingly
::stingent::stringent
::stong::strong
::stornegst::strongest
::stucture::structure
::sturcture::structure
::stuctured::structured
::struggel::struggle
::strugle::struggle
::stuggling::struggling
::stubborness::stubbornness
::studnet::student
::studdy::study
::studing::studying
::stlye::style
::sytle::style
::stilus::stylus
::subconsiously::subconsciously
::subjudgation::subjugation
::submachne::submachine
::sepina::subpoena
::subsquent::subsequent
::subsquently::subsequently
::subsidary::subsidiary
::subsiduary::subsidiary
::subpecies::subspecies
::substace::substance
::subtances::substances
::substancial::substantial
::substatial::substantial
::substituded::substituted
::subterranian::subterranean
::substract::subtract
::substracted::subtracted
::substracting::subtracting
::substraction::subtraction
::substracts::subtracts
::suburburban::suburban
::suceed::succeed
::succceeded::succeeded
::succedded::succeeded
::succeded::succeeded
::suceeded::succeeded
::suceeding::succeeding
::succeds::succeeds
::suceeds::succeeds
::succsess::success
::sucess::success
::succcesses::successes
::sucesses::successes
::succesful::successful
::successfull::successful
::succsessfull::successful
::sucesful::successful
::sucessful::successful
::sucessfull::successful
::succesfully::successfully
::succesfuly::successfully
::successfuly::successfully
::successfulyl::successfully
::successully::successfully
::sucesfully::successfully
::sucesfuly::successfully
::sucessfully::successfully
::sucessfuly::successfully
::succesion::succession
::sucesion::succession
::sucession::succession
::succesive::successive
::sucessive::successive
::sucessor::successor
::sucessot::successor
::sufferred::suffered
::sufferring::suffering
::suffcient::sufficient
::sufficent::sufficient
::sufficiant::sufficient
::suffciently::sufficiently
::sufficently::sufficiently
::sufferage::suffrage
::suggestable::suggestible
::sucidial::suicidal
::sucide::suicide
::sumary::summary
::sunglases::sunglasses
::superintendant::superintendent
::surplanted::supplanted
::suplimented::supplemented
::supplamented::supplemented
::suppliementing::supplementing
::suppy::supply
::wupport::support
::supose::suppose
::suposed::supposed
::suppoed::supposed
::suppossed::supposed
::suposedly::supposedly
::supposingly::supposedly
::suposes::supposes
::suposing::supposing
::supress::suppress
::surpress::suppress
::supressed::suppressed
::surpressed::suppressed
::supresses::suppresses
::supressing::suppressing
::surley::surely
::surfce::surface
::suprise::surprise
::suprize::surprise
::surprize::surprise
::suprised::surprised
::suprized::surprised
::surprized::surprised
::suprising::surprising
::suprizing::surprising
::surprizing::surprising
::suprisingly::surprisingly
::suprizingly::surprisingly
::surprizingly::surprisingly
::surrended::surrendered
::surrundering::surrendering
::surrepetitious::surreptitious
::surreptious::surreptitious
::surrepetitiously::surreptitiously
::surreptiously::surreptitiously
::suround::surround
::surounded::surrounded
::surronded::surrounded
::surrouded::surrounded
::sorrounding::surrounding
::surounding::surrounding
::surrouding::surrounding
::suroundings::surroundings
::surounds::surrounds
::surveill::surveil
::surveilence::surveillance
::surveyer::surveyor
::survivied::survived
::surviver::survivor
::survivers::survivors
::suseptable::susceptible
::suseptible::susceptible
::suspention::suspension
::swaer::swear
::swaers::swears
::swepth::swept
::swiming::swimming
::symettric::symmetric
::symmetral::symmetric
::symetrical::symmetrical
::symetrically::symmetrically
::symmetricaly::symmetrically
::symetry::symmetry
::synphony::symphony
::sypmtoms::symptoms
::synagouge::synagogue
::syncronization::synchronization
::synonomous::synonymous
::synonymns::synonyms
::syphyllis::syphilis
::syrap::syrup
::sytem::system
::sysmatically::systematically
::tkae::take
::tkaes::takes
::tkaing::taking
::talekd::talked
::talkign::talking
::tlaking::talking
::targetted::targeted
::targetting::targeting
::tast::taste
::tatoo::tattoo
::tattooes::tattoos
::teached::taught
::taxanomic::taxonomic
::taxanomy::taxonomy
::tecnical::technical
::techician::technician
::technitian::technician
::techicians::technicians
::techiniques::techniques
::technnology::technology
::technolgy::technology
::telphony::telephony
::televize::televise
::telelevision::television
::televsion::television
::tellt he::tell the
::temperment::temperament
::tempermental::temperamental
::temparate::temperate
::temerature::temperature
::tempertaure::temperature
::temperture::temperature
::temperarily::temporarily
::tepmorarily::temporarily
::temprary::temporary
::tendancies::tendencies
::tendacy::tendency
::tendancy::tendency
::tendonitis::tendinitis
::tennisplayer::tennis player
::tenacle::tentacle
::tenacles::tentacles
::terrestial::terrestrial
::terriories::territories
::terriory::territory
::territoy::territory
::territorist::terrorist
::terroist::terrorist
::testiclular::testicular
::tahn::than
::thna::than
::thansk::thanks
::taht::that
::tath::that
::thgat::that
::thta::that
::thyat::that
::tyhat::that
::thatt he::that the
::thatthe::that the
::thast::that's
::thats::that's
::hte::the
::teh::the
::tehw::the
::tghe::the
::theh::the
::thge::the
::thw::the
::tje::the
::tjhe::the
::tthe::the
::tyhe::the
::thecompany::the company
::thefirst::the first
::thegovernment::the government
::thenew::the new
::thesame::the same
::thetwo::the two
::theather::theatre
::theri::their
::thier::their
::there's is::theirs is
::htem::them
::themself::themselves
::themselfs::themselves
::themslves::themselves
::hten::then
::thn::then
::thne::then
::htere::there
::their are::there are
::they're are::there are
::their is::there is
::they're is::there is
::therafter::thereafter
::therby::thereby
::htese::these
::theese::these
::htey::they
::tehy::they
::tyhe::they
::they;l::they'll
::theyll::they'll
::they;r::they're
::they;v::they've
::theyve::they've
::theif::thief
::theives::thieves
::hting::thing
::thign::thing
::thnig::thing
::thigns::things
::thigsn::things
::thnigs::things
::htikn::think
::htink::think
::thikn::think
::thiunk::think
::tihkn::think
::thikning::thinking
::thikns::thinks
::thrid::third
::htis::this
::tghis::this
::thsi::this
::tihs::this
::thisyear::this year
::throrough::thorough
::throughly::thoroughly
::thsoe::those
::threatend::threatened
::threatning::threatening
::threee::three
::threshhold::threshold
::throuhg::through
::thru::through
::thoughout::throughout
::througout::throughout
::tiget::tiger
::tiem::time
::timne::time
::tot he::to the
::tothe::to the
::tabacco::tobacco
::tobbaco::tobacco
::todya::today
::todays::today's
::tiogether::together
::togehter::together
::toghether::together
::toldt he::told the
::tolerence::tolerance
::tolkein::Tolkien
::tomatos::tomatoes
::tommorow::tomorrow
::tommorrow::tomorrow
::tomorow::tomorrow
::tounge::tongue
::tongiht::tonight
::tonihgt::tonight
::tormenters::tormentors
::toriodal::toroidal
::torpeados::torpedoes
::torpedos::torpedoes
::totaly::totally
::totalyl::totally
::towrad::toward
::towords::towards
::twon::town
::traditition::tradition
::traditionnal::traditional
::tradionally::traditionally
::traditionaly::traditionally
::traditionalyl::traditionally
::tradtionally::traditionally
::trafic::traffic
::trafficed::trafficked
::trafficing::trafficking
::transcendance::transcendence
::trancendent::transcendent
::transcendant::transcendent
::transcendentational::transcendental
::trancending::transcending
::transending::transcending
::transcripting::transcribing
::transfered::transferred
::transfering::transferring
::tranform::transform
::transformaton::transformation
::tranformed::transformed
::transistion::transition
::translater::translator
::translaters::translators
::transmissable::transmissible
::transporation::transportation
::transesxuals::transsexuals
::tremelo::tremolo
::tremelos::tremolos
::triathalon::triathlon
::tryed::tried
::triguered::triggered
::triology::trilogy
::troling::trolling
::toubles::troubles
::troup::troupe
::truely::truly
::truley::truly
::turnk::trunk
::tust::trust
::trustworthyness::trustworthiness
::tuscon::Tucson
::termoil::turmoil
::twpo::two
::typcial::typical
::typicaly::typically
::tyranies::tyrannies
::tyrranies::tyrannies
::tyrany::tyranny
::tyrrany::tyranny
::ubiquitious::ubiquitous
::ukranian::Ukrainian
::ukelele::ukulele
::alterior::ulterior
::ultimely::ultimately
::unacompanied::unaccompanied
::unanymous::unanimous
::unathorised::unauthorised
::unavailible::unavailable
::unballance::unbalance
::unbeleivable::unbelievable
::uncertainity::uncertainty
::unchallengable::unchallengeable
::unchangable::unchangeable
::uncompetive::uncompetitive
::unconcious::unconscious
::unconciousness::unconsciousness
::uncontitutional::unconstitutional
::unconvential::unconventional
::undecideable::undecidable
::indefineable::undefinable
::undert he::under the
::undreground::underground
::udnerstand::understand
::understnad::understand
::understoon::understood
::undesireable::undesirable
::undetecable::undetectable
::undoubtely::undoubtedly
::unforgetable::unforgettable
::unforgiveable::unforgivable
::unforetunately::unfortunately
::unfortunatley::unfortunately
::unfortunatly::unfortunately
::unfourtunately::unfortunately
::unahppy::unhappy
::unilatreal::unilateral
::unilateraly::unilaterally
::unilatreally::unilaterally
::unihabited::uninhabited
::uninterruped::uninterrupted
::uninterupted::uninterrupted
::unitedstates::United States
::unitesstates::United States
::univeral::universal
::univeristies::universities
::univesities::universities
::univeristy::university
::universtiy::university
::univesity::university
::unviersity::university
::unkown::unknown
::unliek::unlike
::unlikey::unlikely
::unmanouverable::unmanoeuvrable
::unmistakeably::unmistakably
::unneccesarily::unnecessarily
::unneccessarily::unnecessarily
::unnecesarily::unnecessarily
::uneccesary::unnecessary
::unecessary::unnecessary
::unneccesary::unnecessary
::unneccessary::unnecessary
::unnecesary::unnecessary
::unoticeable::unnoticeable
::inofficial::unofficial
::unoffical::unofficial
::unplesant::unpleasant
::unpleasently::unpleasantly
::unprecendented::unprecedented
::unprecidented::unprecedented
::unrepentent::unrepentant
::unrepetant::unrepentant
::unrepetent::unrepentant
::unsubstanciated::unsubstantiated
::unsuccesful::unsuccessful
::unsuccessfull::unsuccessful
::unsucesful::unsuccessful
::unsucessful::unsuccessful
::unsucessfull::unsuccessful
::unsuccesfully::unsuccessfully
::unsucesfuly::unsuccessfully
::unsucessfully::unsuccessfully
::unsuprised::unsurprised
::unsuprized::unsurprised
::unsurprized::unsurprised
::unsuprising::unsurprising
::unsuprizing::unsurprising
::unsurprizing::unsurprising
::unsuprisingly::unsurprisingly
::unsuprizingly::unsurprisingly
::unsurprizingly::unsurprisingly
::untill::until
::untranslateable::untranslatable
::unuseable::unusable
::unusuable::unusable
::unwarrented::unwarranted
::unweildly::unwieldy
::unwieldly::unwieldy
::tjpanishad::upanishad
::upcomming::upcoming
::upgradded::upgraded
::useage::usage
::uise::use
::usefull::useful
::usefuly::usefully
::useing::using
::usally::usually
::usualy::usually
::usualyl::usually
::ususally::usually
::vaccum::vacuum
::vaccume::vacuum
::vaguaries::vagaries
::vailidty::validity
::valetta::valletta
::valuble::valuable
::valueable::valuable
::varient::variant
::varations::variations
::vaieties::varieties
::varities::varieties
::variey::variety
::varity::variety
::vreity::variety
::vriety::variety
::varous::various
::varing::varying
::vasall::vassal
::vasalls::vassals
::vegitable::vegetable
::vegtable::vegetable
::vegitables::vegetables
::vegatarian::vegetarian
::vehicule::vehicle
::vengance::vengeance
::vengence::vengeance
::venemous::venomous
::verfication::verification
::vermillion::vermilion
::versitilaty::versatility
::versitlity::versatility
::verison::version
::verisons::versions
::veyr::very
::vrey::very
::vyer::very
::vyre::very
::vacinity::vicinity
::vincinity::vicinity
::vitories::victories
::wiew::view
::vigilence::vigilance
::vigourous::vigorous
::villification::vilification
::villify::vilify
::villian::villain
::violentce::violence
::virgina::Virginia
::virutal::virtual
::virtualyl::virtually
::visable::visible
::visably::visibly
::visting::visiting
::vistors::visitors
::volcanoe::volcano
::volkswagon::Volkswagen
::voleyball::volleyball
::volontary::voluntary
::volonteer::volunteer
::volounteer::volunteer
::volonteered::volunteered
::volounteered::volunteered
::volonteering::volunteering
::volounteering::volunteering
::volonteers::volunteers
::volounteers::volunteers
::vulnerablility::vulnerability
::vulnerible::vulnerable
::watn::want
::whant::want
::wnat::want
::wan tit::want it
::wanna::want to
::wnated::wanted
::whants::wants
::wnats::wants
::wardobe::wardrobe
::warrent::warrant
::warantee::warranty
::warrriors::warriors
::wass::was
::weas::was
::ws::was
::wa snot::was not
::wasnt::wasn't
::wya::way
::wayword::wayward
::we;d::we'd
::weaponary::weaponry
::wether::weather
::wendsay::Wednesday
::wensday::Wednesday
::wiegh::weigh
::wierd::weird
::vell::well
::werre::were
::wern't::weren't
::waht::what
::whta::what
::what;s::what's
::wehn::when
::whn::when
::whent he::when the
::wehre::where
::wherre::where
::where;s::where's
::wereabouts::whereabouts
::wheras::whereas
::wherease::whereas
::whereever::wherever
::whther::whether
::hwich::which
::hwihc::which
::whcih::which
::whic::which
::whihc::which
::whlch::which
::wihch::which
::whicht he::which the
::hwile::while
::woh::who
::who;s::who's
::hwole::whole
::wohle::whole
::wholey::wholly
::widesread::widespread
::weilded::wielded
::wief::wife
::iwll::will
::wille::will
::wiull::will
::willbe::will be
::will of::will have
::willingless::willingness
::windoes::windows
::wintery::wintry
::iwth::with
::whith::with
::wih::with
::wiht::with
::withe::with
::witht::with
::witn::with
::wtih::with
::witha::with a
::witht he::with the
::withthe::with the
::withdrawl::withdrawal
::witheld::withheld
::withold::withhold
::withing::within
::womens::women's
::wo'nt::won't
::wonderfull::wonderful
::wrod::word
::owrk::work
::wokr::work
::wrok::work
::wokring::working
::wroking::working
::workststion::workstation
::worls::world
::worstened::worsened
::owudl::would
::owuld::would
::woudl::would
::wuould::would
::wouldbe::would be
::would of::would have
::woudln't::wouldn't
::wouldnt::wouldn't
::wresters::wrestlers
::rwite::write
::wriet::write
::wirting::writing
::writting::writing
::writen::written
::wroet::wrote
::x-Box::Xbox
::xenophoby::xenophobia
::yatch::yacht
::yaching::yachting
::eyar::year
::yera::year
::eyars::years
::yeasr::years
::yeras::years
::yersa::years
::yelow::yellow
::eyt::yet
::yeild::yield
::yeilding::yielding
::yoiu::you
::ytou::you
::yuo::you
::youare::you are
::you;d::you'd
::your a::you're a
::your an::you're an
::your her::you're her
::your here::you're here
::your his::you're his
::your my::you're my
::your the::you're the
::your their::you're their
::your your::you're your
::youve::you've
::yoru::your
::yuor::your
::you're own::your own
::youself::yourself
::youseff::yousef
::zeebra::zebra
::sionist::Zionist
::sionists::Zionists

;-------------------------------------------------------------------------------
;  Capitalise dates
;-------------------------------------------------------------------------------
::monday::Monday
::tuesday::Tuesday
::wednesday::Wednesday
::thursday::Thursday
::friday::Friday
::saturday::Saturday
::sunday::Sunday 

::january::January
::february::February
; ::march::March  ; Commented out because it matches the common word "march".
::april::April
; ::may::May  ; Commented out because it matches the common word "may".
::june::June
::july::July
::august::August
::september::September
::october::October
::november::November
::december::December

;-----------------------------------------------------------------


::freqy::frequently
::incid::incidentally
::intermity::intermittently
::obvy::obviously
::occy::occasionally
::prevy::previously
::pvy::previously
::regy::regularly
::miny::minimally
::bhvy::behaviorally
::py::pharmacy
::rx::prescription
::rxd::prescribed
::rxs::prescriptions
::rf::refill
::rfs::refills
::med::medication
::meds::medications
::abx::antibiotics
::adep::antidepressant
::bpmed::blood pressure medication
::pmed::pain medication
::ccbu::CostCutter Burlington
::fmbu::Fred Meyer Burlington
::fpav::Food Pavillion
::ghpy::Group Health Pharmacy
::hgbu::Haggen Burlington
::hgmv::Haggen Mount Vernon
::hlsw::Holland Drug
::htmv::Hilltop
::raana::Rite Aid Anacortes
::ramv::Rite Aid Mount Vernon
::rasw::Rite Aid Sedro Wooley
::rnltc::Rainier LTC Sedro Wooley
::swana::Safeway Anacortes
::swmv::Safeway Mount Vernon
::wgana::Walgreens Anacortes
::wgsw::Walgreen Sedro Wooley
::wmmv::Walmart Mount Vernon
::cyp::Could you please
::lmom::Left message on voicemail.
::pau::Patient alert updated.
::phu::History updated in EMR.
::pta::Patient aware already.
::sdoc::See Documents.
::sfs::See flowsheet.
::spc::See paper chart.
::utd::UpToDate
::wyp::Would you please
::ALY::Dr. A. Yinug
::AMM::Dr. A. Meyer
::DBB::Dr. D. Benson
::ERB::Dr. E. Bylund
::GHT::Dr. G. Traylor
::JCG::Dr. J. Gamson
::JGH::Dr. J. Hansom
::JKB::Dr. J. Benson
::JKM::P.A. Ross McConahey
::LAE::Dr. L. Estep
::LCM::Dr. L. Muller
::LSW::Dr. L.S. Winkes
::RPE::Dr. R. Estep
::appt::appointment
::bhv::behavior
::bx::biopsy
::c/s::cesarian section
::chiro::chiropracter
::cx::culture
::ddx::differential diagnosis
::dx::diagnosis
::dz::disease
::eti::etiology
::evaln::evaluation
::exacn::exacerbation
::fu::follow up
::fx::side effects
::hx::history
::mhx::medical history
::pht::physical therapy
::pt::patient
::prob::problem
::probs::problems
::prby::probably
::recn::recommendation
::rfl::referral
::sfx::side effects
::shx::social history
::ss::symptoms
::sx::signs
::ttp::tenderness to palpation
::tx::treatment
::txs::treatments
::u/s::ultrasound
::utox::urine toxicology
::vst::visit
::albu::albuterol
::alpraz::alprazolam
::amitr::amitriptyline
::amox::amoxicillin
::aten::atenolol
::azith::azithromycin
::clonaz::clonazepam
::flon::flonase
::fluox::fluoxetine
::glyb::glyburide
::ibu::ibuprofen
::lisin::lisinopril
::loraz::lorazepam
::lova::lovastatin
::melox::meloxicam
::metf::metformin
::metop::metoprolol
::omep::omeprazole
::perc::percocet
::predn::prednisone
::simv::simvastatin
::tyl::tylenol
::vic::vicodin
::zol::zoloft
::abt::about
::agn::again
::aldy::already
::approp::appropriate
::avail::available
::bc::because
::bn::been
::bt::but
::cd::could
::cm::come
::cn::can
::dd::did
::ea::each
::esp::especially
::fm::from
::fnd::find
::fr::for
::fst::first
::gt::get
::hd::had
::hv::have
::lk::like
::mr::more
::mk::make
::nbr::number
::nt::not
::nw::now
::otr::other
::pls::please
::ppl::people
::prt::part
::sd::said
::sm::some
::smwt::somewhat
::th::the
::thm::them
::thr::there
::thru::through
::tm::time
::tn::then
::ts::this
::tt::that
::ty::they
::wd::would
::wi::with
::wl::will
::wn::when
::wo::without
::wr::were
::wrt::write
::ws::was
::wt::what
::yr::your
::-ic::-- inadequate control
::-s::-- stable
::-uc::-- uncontrolled
::-wc::-- well controlled
::abnl::abnormal
::assc::asymptomatic
::aw::associated with
::bw::better with
::cw::consistent with
::freq::frequent
::ineff::ineffective
::intermit::intermittent
::mult::multiple
::min::minimal
::nl::normal
::obv::obvious
::occ::occasional
::prev::previous
::pv::previous
::reasg::reassuring
::slabnl::slightly abnormal
::slnl::slightly abnormal
::ssc::symptomatic
::unavail::unavailable
::undxd::undiagnosed
::ww::worse with
::contemp::contemplative
::noncontemp::non-contemplative
::reg::regular
::max::maximum
::ck::check
::ckg::checking
::cks::checks
::ckd::checked
::cl::call
::cld::called
::clg::calling
::dc::discontinue
::dcd::discontinued
::dcg::discontinuing
::dcn::discontinuation
::decr::decrease
::decrd::decreased
::decrg::decreasing
::ds::discuss
::dsd::discussed
::dsg::discussing
::dsn::discussion
::dxd::diagnosed
::dxg::diagnosing
::eff::effect
::effs::effects
::effg::effecting
::effv::effective
::effd::effected
::estab::establish
::estabd::established
::estabg::establishing
::eval::evaluate
::evald::evaluated
::evalg::evaluating
::evaln::evaluation
::exac::exacerbate
::exacd::exacerbated
::exacg::exacerbating
::exacn::exacerbation
::fxd::faxed
::fxg::faxing
::impr::improve
::imprg::improving
::imprs::improves
::imprd::improved
::imprn::improvement
::imprt::improvement
::incr::increase
::incrd::increased
::incrg::increasing
::inf::inform
::infd::informed
::infg::informing
::infn::information
::inj::inject
::injd::injected
::injg::injecting
::injn::injection
::injs::injects
::injns::injections
::intk::intake
::nfy::notify
::nty::notify
::ntyd::notified
::ntyg::notifying
::rech::recheck
::rechg::rechecking
::rechd::rechecked
::rechs::rechecks
::reck::recheck
::reckg::rechecking
::reckd::rechecked
::recks::rechecks
::rec::recommend
::recd::recommended
::recg::recommending
::recn::recommendation
::recs::recommendations
::rfr::refer
::rfrd::referred
::rfrn::referral
::rfrg::referring
::rfld::referred
::rq::request
::rqd::requested
::rqs::requests
::rqg::requesting
::rv::review
::rvd::reviewed
::rvg::reviewing
::sdc::self-discontinued
::txd::treated
::txg::treating
::tdy::today
::tdys::today's
::ydy::yesterday
::ydys::yesterday's
::yest::yesterday
::yests::yesterday's
::tmw::tomorrow
::1ha::1 hour ago
::2ha::2 hours ago
::3ha::3 hours ago
::4ha::4 hours ago
::5ha::5 hours ago
::6ha::6 hours ago
::7ha::7 hours ago
::8ha::8 hours ago
::9ha::9 hours ago
::10ha::10 hours ago
::11ha::11 hours ago
::12ha::12 hours ago
::13ha::13 hours ago
::14ha::14 hours ago
::15ha::15 hours ago
::16ha::16 hours ago
::17ha::17 hours ago
::18ha::18 hours ago
::19ha::19 hours ago
::20ha::20 hours ago
::21ha::21 hours ago
::22ha::22 hours ago
::23ha::23 hours ago
::24ha::24 hours ago
::1da::1 day ago
::2da::2 days ago
::3da::3 days ago
::4da::4 days ago
::5da::5 days ago
::6da::6 days ago
::7da::7 days ago
::8da::8 days ago
::9da::9 days ago
::10da::10 days ago
::1wa::1 week ago
::2wa::2 weeks ago
::3wa::3 weeks ago
::4wa::4 weeks ago
::5wa::5 weeks ago
::6wa::6 weeks ago
::7wa::7 weeks ago
::8wa::8 weeks ago
::9wa::9 weeks ago
::10wa::10 weeks ago
::1ma::1 month ago
::2ma::2 months ago
::3ma::3 months ago
::4ma::4 months ago
::5ma::5 months ago
::6ma::6 months ago
::7ma::7 months ago
::8ma::8 months ago
::9ma::9 months ago
::10ma::10 months ago
::11ma::11 months ago
::12ma::12 months ago
::1ya::1 year ago
::2ya::2 years ago
::3ya::3 years ago
::4ya::4 years ago
::5ya::5 years ago
::6ya::6 years ago
::7ya::7 years ago
::8ya::8 years ago
::9ya::9 years ago
::10ya::10 years ago
::11ya::11 years ago
::12ya::12 years ago
::13ya::13 years ago
::14ya::14 years ago
::15ya::15 years ago
::16ya::16 years ago
::17ya::17 years ago
::18ya::18 years ago
::19ya::19 years ago
::20ya::20 years ago
::25ya::25 years ago
::30ya::30 years ago
::35ya::35 years ago
::40ya::40 years ago
::45ya::45 years ago
::50ya::50 years ago
::1h::1 hour
::2h::2 hours
::3h::3 hours
::4h::4 hours
::5h::5 hours
::6h::6 hours
::7h::7 hours
::8h::8 hours
::9h::9 hours
::10h::10 hours
::11h::11 hours
::12h::12 hours
::13h::13 hours
::14h::14 hours
::15h::15 hours
::16h::16 hours
::17h::17 hours
::18h::18 hours
::19h::19 hours
::20h::20 hours
::21h::21 hours
::22h::22 hours
::23h::23 hours
::24h::24 hours
::1d::1 day
::2d::2 days
::3d::3 days
::4d::4 days
::5d::5 days
::6d::6 days
::7d::7 days
::8d::8 days
::9d::9 days
::10d::10 days
::1w::1 week
::2w::2 weeks
::3w::3 weeks
::4w::4 weeks
::5w::5 weeks
::6w::6 weeks
::7w::7 weeks
::8w::8 weeks
::9w::9 weeks
::10w::10 weeks
::1m::1 month
::2m::2 months
::3m::3 months
::4m::4 months
::5m::5 months
::6m::6 months
::7m::7 months
::8m::8 months
::9m::9 months
::10m::10 months
::11m::11 months
::12m::12 months
::1y::1 year
::2y::2 years
::3y::3 years
::4y::4 years
::5y::5 years
::6y::6 years
::7y::7 years
::8y::8 years
::9y::9 years
::10y::10 years
::callfu::Patient will call us to update status
::cypn::Could you please tell patient everything was normal.
::bowr::I think benefits outweigh the risks in this patient.
::dadep::Discussed antidepressants, time course of effects & side effects. Discussed titration, when to call.
::dcpe::Will discuss these labs at the patient's upcoming preventative exam.
::dcv::Discussed cardiovascular major risk factors, reasons to get evaluated emergently, risk factor modification.
::dddx::Discussed differential diagnosis with patient.
::ddoubt::Discussed my doubts that the symptoms are clinically significant.
::deval::Discussed plan for testing to evaluate for diagnosis.
::dexam::Discussed pertinent findings of physical exam today.
::dflonase::Discussed and demonstrated use of nasal corticosteroids.
::dfu::Discussed/Encouraged routine follow up.
::dglucose::Discussed significance (cardiovascular, potential diabetes) and monitoring for glucose intolerance.
::dhscrp::Discussed studies about heart disease and elevated waistline. Check hsCRP and discussed role of statin for heart disease prevention. The most recent study was with Rosuvastatin -- I suspect Simvastatin would have similar effect with better cost effectiveness.
::dinjn::Discussed usual issues around corticosteroid injections (risk for flare, time course, warning signs for infection, etc).
::dlab::Reviewed labs with patient and discussed significance.
::dnh::Discussed usual natural history of this problem.
::dnsaid::Discussed use of anti-inflammatories such as ibuprofen and naproxen. 
::dotc::Discussed how to use OTC medications to help alleviate symptoms.
::dpc::Discussed pros/cons of
::dpsa::Discussed pros/cons of PSA testing and prostate cancer screening.
::dreturn::Discussed reasons to return to clinic for recheck.
::dref::Discussed reasons for referral.
::drexam::Discussed reassuring aspects of physical exam.
::drf::Discussed warning signs to watch for and when to be re-evaluated.
::drtc::Discussed reasons for returning to clinic.
::dsal::Discussed and demonstrated use of saline sinus lavage for symptom reduction.
::dsdm::Discuss at upcoming diabetic follow up visit.
::dse::Discussed common side effects of medication.
::dsleep::Discussed recent studies about sleep and long-term cardiovascular health.
::dsm::Discussed side effects of 
::dstat::Discussed statin medications, pros/cons, side effects.
::dterbinafine::Discussed pros/cons of terbinafine. Reviewed cost, lab monitoring prior to use, problems with definitive diagnosis (KOH unreliable, Culture slow), risk for recurrence. If CMP OK, will start prescription.
::dwarn::Discussed warning signs to watch for.
::dweight::Discussed issues around weight and weight loss options.
::fuinip::Follow up if not improving.
::fuiw::Follow up if worsening.
::dww::Discussed watchful waiting approach. Patient agrees after discussion.
::hbpw::Hope for the best but the prepare for worst.
::innl::Please inform patient results are normal.
::mkappt::Please make follow up appointment for
::rcou::Reviewed Coumadin labs/See Flowsheet.
::rlab::Reviewed labs. Will discuss at Appointment.
::wypn::Would you please inform patient tests were normal.
::UTIconf::Inform patient that bladder infection was confirmed on culture.  Antibiotic looks like it has good coverage.
::UTInoconf::Inform patient that bladder infection was not confirmed on culture. OK to discontinue antibiotics. Let us know if symptoms don't resolve.
::-s::-- stable
::sajkp::See attachment{Enter}{Enter}--Jonathan P.
::att::at that time
::attt::at that time
::pht::physical therapy
::ssjkp::See above subject. --Jonathan P.
::sjkp::{Enter}{Enter}--Jonathan Ploudre, MD
::bx::biopsy
::K-::Karen-{Enter}{Enter}
::H-::Heather-{Enter}{Enter}
::HT-::Hey there-{Enter}{Enter}
::inip::if not improving


::adeps::antidepressants
::o/w::otherwise
::bp::blood pressure
::bps::blood pressures
::ccs::corticosteroid
::rcn::recommendation
::dermun::Dermoscopically unremarkable.
::prophy::prophylaxis
::cv::cardiovascular
::cards::cardiology
::cardt::cardiologist
::pulm::pulmonology
::pulmt::pulmonologist
::gi::gastroenterology
::git::gastroenterologist
::gyn::gynecology
::gynt::gynecologist
::rads::radiology
::radt::radiologist
::ortho::orthopedics
::orthot::orthopedist
::neuro::neurology
::neurot::neurologist
::nephro::nephrology
::nephrot::nephrologist
::ent::otolaryngology
::entt::ENT doc
::rheum::rheumatology
::rheumt::rheumatologist
::derm::dermatology
::dermt::dermatologist
::heme::hematology
::hemet::hematologist
::endo::endocrinology
::endot::endocrinologist
::urot::urologist
::wawa::watchful waiting
::waw::watchful waiting
::osa::obstructive sleep apnea
::neg::negative
::bilaty::bilaterally
::bilat::bilateral
::inity::initially
::init::initial
::initg::initiating
::initv::initiative
::initn::initiation
::inits::initiates
::initd::initiated
::outpt::outpatient
::abd::abdominal 
::signif::significant
::signife::significance
::psych::psychiatry
::cxr::chest x-ray
::sscy::symptomatically
::fam::family
::poss::possible
::possy::possibly
::preg::pregnant
::pregy::pregnancy
::wgt::weight
::wgtl::weight loss
::sz::seizure
::szs::seizures
::vsts::visits
::htn::hypertension
::afib::atrial fibrillation
::reg::regular
::regy::regularly
::irreg::irregular
::irregy::irregularly
::doc::doctor
::gen::general
::geny::generally
::ctx::contractions
::wu::workup
::evid::evidence
::pna::pneumonia
::diff::different
::diffe::difference
::elev::elevate
::elevd::elevated
::elevs::elevates
::elevg::elevating
::elevn::elevation
::hosp::hospital
::hospn::hospitalization
::rfd::refilled
::rfg::refilling
::rfs::refills
::chemo::chemotherapy
::uro::urology
::bili::bilirubin
::surg::surgery
::usuy::usually
::usu::usual
::cryo::cryotherapy
::cont::continue
::conts::continues
::contg::continuing
::contd::continued
::contn::continuation
::bgn::begin
::bgng::beginning
::bgns::begins
::pnd::post-nasal drip
::benzos::benzodiazepines
::tabs::tablets
::tab::tablet
::dxs::diagnoses
::assoc::associate
::assocd::associated
::assocs::associates
::assocg::associating
::assocn::association
::incl::include
::inclg::including
::incls::includes
::incld::included
::incle::inclusive
::excl::exclude
::exclg::excluding
::excls::excludes
::exclg::excluding
::esi::epidural steroid injection
::rxg::prescribing
::dm::diabetes
::rease::reassurance
::dwgtl::Discussed the significance of weight loss for this patient's health
::hh-::Hey Heather-`r`r
::pcp::personal physician
::vist::visit
::duv::Discuss at upcoming visit.
::rrlab::We reviewed the patient's recent labwork.
::titr::titrate
::titrd::titrated
::titrg::titrating
::titrs::titrates
::titrn::titration
::epw::Explored patient willingness.
::dosa::Discussed the significance of obstructive sleep apnea (including cardiovascular risks, bidirectional effect with weight, lifestyle benefits of treatment). Explained the general process of evaluation and common troubles with compliance.
::nad::and
::dispo::disposition
::incrs::increases
::sched::schedule
::schedd::scheduled
::scheds::schedules
::schedg::scheduling
::addnl::additional
::addn::addition
::vs::versus
::prgr::progress
::prgrg::progressing
::prgrs::progresses
::prgrd::progressed
::prgre::progressive
::prgrv::progressive
::rtc::return to clinic
::appts::appointments
::hospns::hospitalizations
::antic::anticipate
::antics::anticipates
::anticn::anticipation
::anticd::anticipated
::anticy::anticipatory
::anticg::anticipating
::dnopsa::Discussed pros/cons of PSA testing and prostate cancer screening. After discussion, patient opted against lab screening.
::bdnowr::I think benefits **do not** outweigh the risks in this patient.
::refu::refuse
::refud::refused
::refug::refusing
::refus::refuses
::reful::refusal
::mm::muscle
::mms::muscles
::postop::postoperative
::rcd::record
::rcds::records
::rcdg::recording
::rcdd::recorded
::dpd::depend
::dpdg::depending
::dpds::depends
::dpdd::depended
::wrs::worse
::wrsn::worsen
::wrsg::worsening
::wsrd::worsened
::bham::Bellingham
::devel::develop
::develd::developed
::devels::develops
::develg::developing
::develt::development
::redu::reduce
::redus::reduces
::redug::reducing
::redud::reduced
::redun::reduction
::dherbal::Discussed botanical options for symptom control.
::dmedtitr::Discussed the possibility of the patient doing a self-titration of the medication.
::untxd::untreated
::dholdmed::Discussed a trial of holding a medication for a few weeks and monitoring for potential side effect.
::c/w::consistent with
::unremark::unremarkable
::dholdabx::Prescribed antibiotics but a plan to hold and monitor symptoms for now.
::inad::inadequate
::fxn::function
::fxnd::functioned
::fxns::functions
::fxng::functioning
::fxnl::functional
::dpedsleep::Discussed pediatric sleep issues, consider/use melatonin (pros/cons), role of sleep in development (behaviorally, mental health, etc).
::dxr::Discussed the findings on the x-ray from today.
::sdcn::self-discontinuation
::dxc::diagnostic
::dpedfever::Discussed fever management in children, dosing of medications, alternating ibuprofen and tylenol.
::fud::followed up
::wud::worked up
::fug::following up
::wug::working up
::epi::episode
::onco::oncology
::oncot::oncologist
::contrib::contribute
::contribg::contributing
::contribs::contributes
::contribn::contribution
::contribd::contributed
::dfever::Discussed importance of fever control and how to manage with OTC medications.
::dfenofibrate::Discussed studies about fenofibrate in diabetics pros/cons.
::inady::inadequately
::elim::eliminate
::elimd::eliminated
::elimn::elimination
::elims::elininates
::elimg::eliminating
::dopiate::Discussed value/usage of opiates for pain relief.
::pyelo::pyelonephritis
::dpolypill::Discussed the polypill studies as an introduction to cardiovascular issues.
::dmelox::Discussed the use of meloxiam for inflammation (chosen for dosing simplicity.)
::dexcercise::Discussed importance of exercise/lifestyle activity. Ways to increase.
::dutd::Discussed research/evidence based on UpToDate review.
::ineffv::ineffective
::ccsi::corticosteroid injection
::dssc::Discussed doing symptomatic treatment and monitor for now.
::glui::glucose intolerance
::spont::spontaneous
::sponty::spontaneously
::approxy::approximately
::approx::approximate
::nly::normally
::sev::several
::sensn::sensation
::sensv::sensitive
::b4::before
::psycht::psychiatrist
::sensvy::sensitivity
::dtlc::Discussed conservative self-care measures.
::noinj::No injury or trauma.
::pry::probably
::dselflimit::Anticipate this will be self-limiting.
::clinip::call if not improving
::wcc::well child check
::nebs::nebulizer
::immed::immediate
::immedy::immediately
::abnly::abnormality
::abnlys::abnormalities
::pos::positive
::behav::behavior
::bxd::biopsied
::hospd::hospitalized
::ucc::urgent care
::sim::similar
::simy::similarly
::dysfxn::dysfunction
::dysfxnl::dysfunctional 
::fxnl::functional
::fxn::function
::inie::if not effective
::b4d::beforehand
::exacs::exacerbates
::amap::as much as possible
::podt::podiatrist
::euvu::elongated uvula
::clinip::Call if not improving.
::dnpt::Discussed self-testing (Nocturnal Penile Tumescence) and significance of results for differentiating between psychogenic and organic erectile dysfunction.
::dbpcard::discussed blood pressure self-monintoring and recording.
::dnoflut::although symptoms overlap with influenza, I do not think testing necessary.
::dsdc::Discussed a trial of medication discontinuation and careful monitoring for symptom recurrence.
::temp::temporary
::dflutx::Discussed plan of controlling fever (tylenol and ibuprofen), hydrating, staying home.
::rhumid::Recommend ultrasonic humidifier.
::gluin::glucose intolerance
::postopy::postoperatively
::distrib::distribute
::distribn::distribution
::distribs::distributes
::distribd::distributed
::distribg::distributing
::insl::Please inform patient results are stable. 
::benzo::benzodiazepine
::tempy::temporarily
::pyt::pharmacist
::smaw::small airway
::txa::treatment agreement
::acu::acute
::acuy::acutely
::chron::chronic
::chrony::chronically
::ddxi::differential diagnosis includes
::ddxe::differential diagnosis excludes
::comor::comorbid
::comory::comorbidity
::mod::moderate
::mody::moderately
::modg::moderating
::modd::moderated
::mods::moderates
::modn::moderation
::fu1d::follow up in 1 day
::fu2d::follow up in 2 days
::fu3d::follow up in 3 days
::fu4d::follow up in 4 days
::fu5d::follow up in 5 days
::fu6d::follow up in 6 days
::fu7d::follow up in 7 days
::fu8d::follow up in 8 days
::fu9d::follow up in 9 Days
::fu10d::follow up in 10 days
::fu1w::follow up in 1 week
::fu2w::follow up in 2 weeks
::fu3w::follow up in 3 weeks
::fu4w::follow up in 4 weeks
::fu5w::follow up in 5 weeks
::fu6w::follow up in 6 weeks
::fu7w::follow up in 7 weeks
::fu8w::follow up in 8 weeks
::fu9w::follow up in 9 weeks
::fu10w::follow up in 10 weeks
::funw::follow up next week
::funm::follow up next month
::funy::follow up next year
::fu1m::follow up in 1 month
::fu2m::follow up in 2 months
::fu3m::follow up in 3 months
::fu4m::follow up in 4 months
::fu5m::follow up in 5 months
::fu6m::follow up in 6 months
::fu7m::follow up in 7 months
::fu8m::follow up in 8 months
::fu9m::follow up in 9 months
::fu10m::follow up in 10 months
::fu11m::follow up in 11 months
::fu12m::follow up in 12 months
::fu1y::follow up in 1 year
::fuprn::follow up as needed.
::nh1w::Anticipate better in 1 week.
::nh2w::Anticipate better in 2 weeks.
::nh3w::Anticipate better in 3 weeks.
::nh4w::Anticipate better in 4 weeks.
::nh5w::Anticipate better in 5 weeks.
::nh6w::Anticipate better in 6 weeks.
::nhsd::Anticipate better in the next several days.
::exer::exercise
::sigo::significant other
::prg::progress
::prgn::progression
::prgg::progressing
::prgd::progressed
::prgs::progresses
::dly::daily
::surgs::surgeries
::adeq::adequate
::dlk::D. Kutzke, ARNP
::contriby::contributory
::fus::follows up
::orig::original
::origy::originally
::ddm::Discussed using high-dose dextromethorphan (60mg) for cough.
::rel::relate
::relt::relate to
::rels::relates
::relst::relates to
::reld::related
::reldt::related to
::relg::relating
::relgt::relating to
::reln::relation
::relnt::relation to
::relv::relative
::relvs::relatives
::relvt::relative to
::rely::relatively
::dist::distant
::disty::distantly
::dists::disances
::diste::distance
::reso::resolve
::resos::resolves
::resod::resolved
::resog::resolving
::reson::resolution
::confu::confuse
::confud::confused
::confun::confusion
::confus::confuses
::confug::confusing
::anticoag::anticoagulate
::anticoags::anticoagulates
::anticoagd::anticoagulated
::anticoagn::anticoagulation
::anticoagg::anticoagulating
::dccst::Discussed issues around corticosteroid topicals, efficacy, length of use versus potency, risks.
::epis::episodes
::dhomeosa::Patient will check with family if she snores, gasps, chokes or stops breathing at nighttime.
::dtitrmed::Discussed the possibility of the patient doing a self-titration of the medication. 
::mxd::Dr. M. Dubek
::emds::e-MDs
::ptau::Patient alert updated.
::appropy::appropriately
::pcwp::Please clarify with patient.
::remo::remove
::remod::removed
::remog::removing
::remol::removal
::remos::removes
::effy::efficacy
::lsg::longstanding
::mng::manage
::mngd::managed
::mngg::managing
::mngs::manages
::mngt::management
::mntr::monitor
::mntrg::monitoring
::mntrs::monitors
::mntrd::monitored
::docu::document
::docug::documenting
::docud::documented
::docus::documents
::docun::documentation
::inapprop::inappropriate 
::simva::simvastatin
::txo::treatment options
::famhx::family history
::medhx::medical history
::sochx::social history
::surghx::surgical history 
::d/o::disorder
::rslt::result
::rslts::results
::rsltg::resulting
::rsltd::resulted
::intol::intolerable
::intols::intolerable side effects
::ptag::Patient agreeable.
::sys::system
::syss::systems
::syscy::systemically
::sysc::systemic
::comb::combine
::combs::combines
::combd::combined
::combg::combining
::combn::combination
::combns::combinations
::combo::combination
::combos::combinations
::nec::necessary
::im::improve
::imd::improved
::img::improving
::ims::improves
::imt::improvement
::hxo::history of
::anx::anxious
::anxy::anxiety
::wus::workups
::elevns::elevations
::nathx::natural history 
::unreld::unrelated
::conty::continuity
; Here are new abbreviations or ones that don't log as easily (programatic)
::cdn::
SendInput Call Doctor Note:{Enter 2}SITUATION:{Enter 3}BACKGROUND:{Enter 3}ASSESSMENT:{Enter 3}RECOMENDATION:{Enter 2}{Up 10}
return
:r:sbar::
SendInput SITUATION:{Enter 3}BACKGROUND:{Enter 3}ASSESSMENT:{Enter 3}RECOMENDATION:{Enter 2}{Up 10}
return
::sdjkp::
SendInput /JKP %A_MMM% %A_DD%, %A_YYYY%
return