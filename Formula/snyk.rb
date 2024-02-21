class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1280.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1280.1/snyk-macos"
    sha256 "f88a95c6edcce9b0e2e9dae03e70a97a7d50dfac3af7904dd03d03526db86908"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1280.1/snyk-macos-arm64"
    sha256 "975edd717902cdf05a925a20969c8ed4c7a9900a8f6e8e7c9911d9905b1115f7"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1280.1/snyk-linux"
    sha256 "ca59ed62df6d55fc5ffe476b1bb219977bce49c5fb64237dd4547523bb71720a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1280.1/snyk-linux-arm64"
    sha256 "708baf24b8764887b1a360ae62ccd0d82e56a65d28ecdc0dccfe1af4496eff48"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
