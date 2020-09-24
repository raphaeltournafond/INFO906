package fr.usmb.m2isc.chronopost.ejb;

import fr.usmb.m2isc.chronopost.jpa.Coordinate;
import fr.usmb.m2isc.chronopost.jpa.Package;
import fr.usmb.m2isc.chronopost.jpa.PackageStatus;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Stateless
@LocalBean
public class PackageEJB {
    @PersistenceContext
    private EntityManager em;

    /**
     * Mandatory constructor without parameters
     */
    public PackageEJB() {
    }

    /**
     * Add a new package
     *
     * @param weight package's weight
     * @param value package's value
     * @param origin package's origin
     * @param destination package's destination
     * @param latitude package's latitude
     * @param longitude package's longitude
     * @param location package's location
     * @return Added package
     */
    public Package addPackage(float weight, float value, String origin, String destination, String latitude, String longitude, String location) {
        Package p = new Package(weight, value, origin, destination);
        em.persist(p);
        // PackageStatus ps = new PackageStatus(new Coordinate(latitude, longitude), new Timestamp(System.currentTimeMillis()), location, PackageStatus.State.REGISTRATION);
        // List<PackageStatus> packageStatusList = new ArrayList<>();
        // packageStatusList.add(ps);
        // p.setPackageStatusList(packageStatusList);
        return p;
    }
}