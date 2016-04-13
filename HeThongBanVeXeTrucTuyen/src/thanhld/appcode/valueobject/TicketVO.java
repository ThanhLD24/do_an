package thanhld.appcode.valueobject;

public class TicketVO {
	private String ticketId;
	private int busId;
	private String busType;
	private String carrierName;
	private String busFeature;
	private String startTime;
	private String startDate;
	private String startBusStation;
	private String endTime;
	private String endDate;
	private String endBusStation;
	private String countSeat;
	private int priceTotal;
	private int numberOriginPlace;
	private int numberDestinationPlace;
	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getCarrierName() {
		return carrierName;
	}
	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}
	public String getBusFeature() {
		return busFeature;
	}
	public void setBusFeature(String busFeature) {
		this.busFeature = busFeature;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartBusStation() {
		return startBusStation;
	}
	public void setStartBusStation(String startBusStation) {
		this.startBusStation = startBusStation;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndBusStation() {
		return endBusStation;
	}
	public void setEndBusStation(String endBusStation) {
		this.endBusStation = endBusStation;
	}
	public String getCountSeat() {
		return countSeat;
	}
	public void setCountSeat(String countSeat) {
		this.countSeat = countSeat;
	}
	public int getPriceTotal() {
		return priceTotal;
	}
	public void setPriceTotal(int priceTotal) {
		this.priceTotal = priceTotal;
	}
	public int getNumberOriginPlace() {
		return numberOriginPlace;
	}
	public void setNumberOriginPlace(int numberOriginPlace) {
		this.numberOriginPlace = numberOriginPlace;
	}
	public int getNumberDestinationPlace() {
		return numberDestinationPlace;
	}
	public void setNumberDestinationPlace(int numberDestinationPlace) {
		this.numberDestinationPlace = numberDestinationPlace;
	}
	public TicketVO(String ticketId, int busId, String busType, String carrierName, String busFeature,
			String startTime, String startDate, String startBusStation, String endTime, String endDate,
			String endBusStation, String countSeat, int priceTotal, int numberOriginPlace, int numberDestinationPlace) {
		super();
		this.ticketId = ticketId;
		this.busId = busId;
		this.busType = busType;
		this.carrierName = carrierName;
		this.busFeature = busFeature;
		this.startTime = startTime;
		this.startDate = startDate;
		this.startBusStation = startBusStation;
		this.endTime = endTime;
		this.endDate = endDate;
		this.endBusStation = endBusStation;
		this.countSeat = countSeat;
		this.priceTotal = priceTotal;
		this.numberOriginPlace = numberOriginPlace;
		this.numberDestinationPlace = numberDestinationPlace;
	}
	public TicketVO() {
		super();
	}
	@Override
	public String toString() {
		return "TicketVO [ticketId=" + ticketId + ", busId=" + busId + ", busType=" + busType + ", carrierName="
				+ carrierName + ", busFeature=" + busFeature + ", startTime=" + startTime + ", startDate=" + startDate
				+ ", startBusStation=" + startBusStation + ", endTime=" + endTime + ", endDate=" + endDate
				+ ", endBusStation=" + endBusStation + ", countSeat=" + countSeat + ", priceTotal=" + priceTotal
				+ ", numberOriginPlace=" + numberOriginPlace + ", numberDestinationPlace=" + numberDestinationPlace
				+ "]";
	}
	
	
}
