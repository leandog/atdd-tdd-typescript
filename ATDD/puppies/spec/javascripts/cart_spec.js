describe("Cart", function() {
    var adoption;

    beforeEach(function() {
        loadFixtures("adoption.html");
        adoption = new Adoption();
    });

    it("should add the Collar & Leash to the total when it is selected", function() {
        var cartTotal = jQuery('.total_cell').children().first().html();
        expect(cartTotal).toEqual("$34.95");
        expect(jQuery('#collar')).not.toBeChecked();
        jQuery('#collar').click();
        expect(jQuery('#collar')).toBeChecked();
    });
});
