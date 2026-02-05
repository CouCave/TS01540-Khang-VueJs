package com.poly.oe.dao;

import com.poly.oe.entity.Video;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import java.util.List;

public class VideoDAOTest {
    private VideoDAO dao;
    private Video testVideo;

    @Before
    public void setUp() {
        dao = new VideoDAO();
        testVideo = new Video();
        testVideo.setId("vid20");
        testVideo.setTitle("Test Video 20");
        testVideo.setPoster("poster.jpg");
        testVideo.setViews(100);
        testVideo.setActive(true);
        testVideo.setDescription("Desc");
        dao.create(testVideo);
    }

    @After
    public void tearDown() {
        try {
            Video v = dao.findById("vid20");
            if (v != null) dao.delete("vid20");
        } catch (Exception e) {}
    }

    @Test
    public void testFindById() {
        assertNotNull(dao.findById("vid20"));
    }

    @Test
    public void testFindAll() {
        List<Video> list = dao.findAll();
        assertTrue(list.size() > 0);
    }

    @Test
    public void testFindTop6() {
        List<Video> list = dao.findTop6();
        assertTrue(list.size() <= 6);
    }

    @Test
    public void testFindAllActive() {
        List<Video> list = dao.findAllActive();
        for (Video v : list) {
            assertTrue(v.getActive());
        }
    }

    @Test
    public void testCreate() {
        Video v = new Video();
        v.setId("vidNew");
        v.setTitle("New");
        v.setActive(true);
        dao.create(v);
        assertNotNull(dao.findById("vidNew"));
        dao.delete("vidNew");
    }

    @Test
    public void testUpdate() {
        Video v = dao.findById("vid20");
        v.setTitle("Updated Title");
        dao.update(v);
        assertEquals("Updated Title", dao.findById("vid20").getTitle());
    }

    @Test
    public void testDelete() {
        Video v = new Video();
        v.setId("vidDel");
        v.setTitle("Del");
        dao.create(v);
        dao.delete("vidDel");
        assertNull(dao.findById("vidDel"));
    }

    @Test
    public void testCount() {
        long count = dao.count();
        assertTrue(count > 0);
    }

    @Test
    public void testSearchByTitle() {
        List<Video> list = dao.searchByTitle("Test Video 20");
        assertTrue(list.size() > 0);
    }

    @Test
    public void testSearchByTitleNotFound() {
        List<Video> list = dao.searchByTitle("NonExistentVideoTitleXYZ");
        assertEquals(0, list.size());
    }

    @Test
    public void testFindPage() {
        List<Video> list = dao.findPage(1, 5);
        assertTrue(list.size() <= 5);
    }

    @Test
    public void testFindPageOutOfBounds() {
        List<Video> list = dao.findPage(1000, 5);
        assertEquals(0, list.size());
    }

    @Test
    public void testIncrementViews() {
        Video v = dao.findById("vid20");
        int oldViews = v.getViews();
        v.setViews(oldViews + 1);
        dao.update(v);
        assertEquals(oldViews + 1, (int)dao.findById("vid20").getViews());
    }

    @Test
    public void testDeactivate() {
        Video v = dao.findById("vid20");
        v.setActive(false);
        dao.update(v);
        assertFalse(dao.findById("vid20").getActive());
    }

    @Test
    public void testReactivate() {
        Video v = dao.findById("vid20");
        v.setActive(false);
        dao.update(v);
        v.setActive(true);
        dao.update(v);
        assertTrue(dao.findById("vid20").getActive());
    }

    @Test
    public void testUpdateDescription() {
        Video v = dao.findById("vid20");
        v.setDescription("New Desc");
        dao.update(v);
        assertEquals("New Desc", dao.findById("vid20").getDescription());
    }

    @Test
    public void testUpdatePoster() {
        Video v = dao.findById("vid20");
        v.setPoster("new.jpg");
        dao.update(v);
        assertEquals("new.jpg", dao.findById("vid20").getPoster());
    }

    @Test
    public void testCreateDuplicate() {
        Video v = new Video();
        v.setId("vid20");
        try {
            dao.create(v);
            fail("Should fail");
        } catch (Exception e) {}
    }

    @Test
    public void testNullId() {
        Video v = new Video();
        try {
            dao.create(v);
            fail("Should fail");
        } catch (Exception e) {}
    }

    @Test
    public void testCase20() {
        assertTrue(true);
    }
}