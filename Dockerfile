FROM adcircorg/adcirc-base:2025.0.2
SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

USER root

RUN mkdir /home/adcirc/adcirc-testsuite
COPY adcirc /home/adcirc/adcirc-testsuite/adcirc
COPY adcirc-swan /home/adcirc/adcirc-testsuite/adcirc-swan
COPY test_runner /home/adcirc/adcirc-testsuite/test_runner
COPY *.py *.sh *.yaml /home/adcirc/adcirc-testsuite/
WORKDIR /home/adcirc
RUN source /opt/spack-environment/activate.sh && \
    pip3 install PyYAML xarray tqdm cartopy netCDF4


WORKDIR /home/adcirc
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/bin/bash" ]
