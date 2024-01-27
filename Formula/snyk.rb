class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1275.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1275.0/snyk-macos"
    sha256 "db77ae97c70e7e3afd8d988b38b34a192a8aed241b03dad86a5db09c3860e82f"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1275.0/snyk-macos-arm64"
    sha256 "b51248c49fca8aaaec448bc89b565301b09d1bdf15d1940c5861b3d00dfd0384"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1275.0/snyk-linux"
    sha256 "d59542cf81b9d9ccbd4871bf8729357ce509668200435f49d8566ae2be16e680"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1275.0/snyk-linux-arm64"
    sha256 "ebdb8435ce9cabd4d7751c110279735f631aa283f5928388bbdb172d19022054"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
