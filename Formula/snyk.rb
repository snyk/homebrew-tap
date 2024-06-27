class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1292.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.0/snyk-macos"
    sha256 "e1aa3ee4894e2de58821de2a803863996da03279d43dccd1ccea97bae1e19282"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.0/snyk-macos-arm64"
    sha256 "c08c34525c8f939f9b02814c990507c512ca7268e8df664c2a42d8d7b0f19c3a"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.0/snyk-linux"
    sha256 "37f5fd4fd1272b90d23262675e9ac067c32934e856528e10da6962b12c40e4c7"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.0/snyk-linux-arm64"
    sha256 "6ac001927c5e70391d078208eb51f52ffdf0583ada21955482979a981cd03756"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
