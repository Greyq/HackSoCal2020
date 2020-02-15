final class Timer {

    private long time;

    Timer() {
        time = -1;
    }

    boolean passed(double ms) {
        return System.currentTimeMillis() - this.time >= ms;
    }

    void reset() {
        this.time = System.currentTimeMillis();
    }
}
